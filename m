Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25D6C4828D
	for <ath12k@archiver.kernel.org>; Mon,  5 Feb 2024 15:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3NBvNB3ukRCgMCQkFC8ukY1dajvBGzdDfaCB28xna0M=; b=dGbNdoKbHMP8ji+I0uHuPmPYZ+
	7p5kUtR9BawzS9JlHdKJ4rUzjjOMFzIcxm6LymIWBX7G/Tk9MGk4LkoUiPT67meebB99Lvu2k9Nhm
	mhYV0G0Yan2smf44qxZ7vrdcIJ02hcAnsyU4Z6u6AHVP9GNziZWPUzbFT6Ep/Cm57415QzoDe5VTv
	W/WIh03Wvdo1uhW8vqigqoPzypwnvA0q20vafq+CUGW1Pvl84ilPkILfeKiHYKIgG4iNq+Uahk38+
	8I/8JXzS1tu+pcpfQFIEvvQfIZveO70N/K4UpbqMe9eNwYNZGdLjnjIAt+xL+uEfdIcvdR+bTA49q
	F1y0942w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX0yR-00000003oGp-24GE
	for ath12k@archiver.kernel.org;
	Mon, 05 Feb 2024 15:33:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX0yO-00000003oFs-15tj
	for ath12k@lists.infradead.org;
	Mon, 05 Feb 2024 15:33:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C195E611A8;
	Mon,  5 Feb 2024 15:33:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80476C433F1;
	Mon,  5 Feb 2024 15:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707147207;
	bh=6iTFrvJAlXrTQK6rSTcfoffNSGiD1ihYuYHfELRZ3H0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=YJ6H9gv5XVWGRXRfH/CwMgxmQCGECuj8tXdLp2Sg82MBAL9uKTuWVKbHoxTiXQQA9
	 TU3ZYkoyzjudyl+t/Loo0/Sv9gHFhQzFD+TwfsFHBU15mVUWeXbNnpn0/BqG3KTkiD
	 RkzKAoKiqbBDld6uj9q9ujZQeYIos2BkOuBD/hZEr+8eezElLBhCgro58+/01MOSbM
	 wpIkNhKdYufJFxo26mkd3CbQNZKzA2wsEgSaeI+dTzXiFE+CFoFcFey0IJnBgG3kAh
	 H3F2iHZnyVUNUeak72J/uuiXASJaehW4BMdhSIjf7T1p7z9jbaO4zE89RMmzc+08H3
	 lAXb5kakT5Gng==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kang Yang <quic_kangyang@quicinc.com>,  <ath12k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v6 02/11] wifi: ath12k: fix incorrect logic of
 calculating vdev_stats_id
References: <20240130040303.370590-1-quic_kangyang@quicinc.com>
	<20240130040303.370590-3-quic_kangyang@quicinc.com>
	<ebd1b476-7de7-4cd2-96b0-ae4965348ccb@quicinc.com>
Date: Mon, 05 Feb 2024 17:33:24 +0200
In-Reply-To: <ebd1b476-7de7-4cd2-96b0-ae4965348ccb@quicinc.com> (Jeff
	Johnson's message of "Tue, 30 Jan 2024 08:51:06 -0800")
Message-ID: <87sf27rkmz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_073328_360259_9D0CE95E 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 1/29/2024 8:02 PM, Kang Yang wrote:
>> During calculate vdev_stats_id, will compare vdev_stats_id with
>> ATH12K_INVAL_VDEV_STATS_ID by '<='. If vdev_stats_id is relatively
>> small, then assign ATH12K_INVAL_VDEV_STATS_ID to vdev_stats_id.
>> 
>> This logic is incorrect. Firstly, should use '>=' instead of '<=' to
>> check if this u8 variable exceeds the max valid range.
>> 
>> Secondly, should use the maximum value as comparison value.
>> 
>> Correct comparison symbols and use the maximum value
>> ATH12K_MAX_VDEV_STATS_ID for comparison.
>> 
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>
> should be blank line between unofficial Tested-on tag and official Fixes tag
>
>> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
>> 
> And no blank line here since all the official tags should be together
>
>> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
>
> Kalle can fix the above when he moves into the pending branch

Yes, fixed those now.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

