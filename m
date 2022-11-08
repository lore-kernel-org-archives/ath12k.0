Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F52CC433FE
	for <ath12k@archiver.kernel.org>; Tue,  8 Nov 2022 14:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L09sPbD04n9ckD3bggI/dGliVfnKW3i3XqUzpS5fx7s=; b=GRqHDBMt9AR4H4
	UGtUKt2Sy/ZV1htMk+ihjE5iihwgREw1Gi+ncQ3RkyQqp5lpSGF4Gzxd90IZJ7wChhMVs3fwxzZWu
	uT1CG36c7URIUm2eWvYSzM1EPUArssJso+WrALYCteIZADhsDElpIpFTwODMOF+AQCC9/0kpFAXzh
	vrJIVKYjIF1r26U4y5eU+A8cSdL3ooK1NUhoM4soHY6A7y5R31cZCM5siqd4CmRaVBHbpgIkW6T8M
	Pt+7DrsV23P9NE1L350Vmn3RgrG8sVU2r93qotj3s9fSvzTNwxWQhLuTXU5hnnbydjHGB7/oqSXWv
	u4hB0tDcz+ji23lgkQQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osQ4J-006Aqa-GF
	for ath12k@archiver.kernel.org; Tue, 08 Nov 2022 14:59:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osQ4G-006AmF-Ho
	for ath12k@lists.infradead.org; Tue, 08 Nov 2022 14:59:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F0E8A615D4;
	Tue,  8 Nov 2022 14:59:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ECB0C433C1;
	Tue,  8 Nov 2022 14:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667919544;
	bh=vFhIltWmITKlHXvJoUUzOLAmI85IxHcQqbjPo2Zb26U=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=enLKWTwToJk/L3Sx/KGmVCkGwv/JruAl9xbGc68tTZHIPSGA66ZD5mjMFH/Aczmut
	 vFTn0V/8s0rYrqnz93jqBOkTsbl+auq0U7pV3Rft2fBaS9IwO3jRw5dphpQpVY+Qo0
	 LeMVmavPArt7KH4m1RSV5+Vjdd2lVipbPfbjbu/502ET6afEnzkomNgk9wZUd3iA9d
	 nqnLQtiVDd03EX9THs3MRDhHPXrszhggEmqgeVacU0GV7156BS0PYqLjCw6td6n1m1
	 I4L2pjaZyzXWGg+/M0IC9qQH8+RDp+DCea1YeO1LIShlh+B/4VcQBiIZ8wxvi8g/Ed
	 QZHirEsNSwbaw==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <linux-wireless@vger.kernel.org>,  <ath12k@lists.infradead.org>
Subject: Re: [PATCH 39/50] wifi: ath12k: add qmi.c
References: <20220812161003.27279-1-kvalo@kernel.org>
	<20220812161003.27279-40-kvalo@kernel.org>
	<30a097d8-d084-2a1e-f067-bb7a303968da@quicinc.com>
Date: Tue, 08 Nov 2022 16:59:01 +0200
In-Reply-To: <30a097d8-d084-2a1e-f067-bb7a303968da@quicinc.com> (Jeff
	Johnson's message of "Mon, 22 Aug 2022 10:14:17 -0700")
Message-ID: <87v8npcx1m.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_065912_664081_CA72E6C9 
X-CRM114-Status: GOOD (  11.82  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 8/12/2022 9:09 AM, Kalle Valo wrote:
>> From: Kalle Valo <quic_kvalo@quicinc.com>
>>
>> (Patches split into one patch per file for easier review, but the final
>> commit will be one big patch. See the cover letter for more info.)
>>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/qmi.c | 3305 +++++++++++++++++++++++++++++++++
>>   1 file changed, 3305 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c
>> b/drivers/net/wireless/ath/ath12k/qmi.c
> [...]
>> +static struct qmi_elem_info
>> qmi_wlfw_qdss_trace_config_download_req_msg_v01_ei[] = {
>
> FYI I've submitted a patch which will allow these to be const:
> <https://lore.kernel.org/linux-arm-msm/20220822153435.7856-1-quic_jjohnson@quicinc.com/T/#u>

Thanks, I'll fix this.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
