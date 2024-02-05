Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49751C48292
	for <ath12k@archiver.kernel.org>; Mon,  5 Feb 2024 16:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Q7PLjfzclkQe4EodDbx0NkMIRhR/Bp3NrlPpbzPjVE=; b=WgcwvrhWg5ZS0M9GttxQa+WV/p
	UrfBXAyKX4odg2gL+ZMSBJPRjA8WC6BE0KQqAAEDCc7ez8MhDEv9B9zxwWow9OYsHk0Qh871bqruD
	EDNBdVStD7339Fy3KL205joa9Zp/+dPY6ISks0l62f4vCpqxVPefRXCGhOvs0SpnHmX51L/LTz/hG
	PVr41bTtMOix2CnJxgFPW8jZd+JGArzSNNXpQImiaMWk2DNEZjab7SDKjT49xtY/Xf81pg/TY4x2l
	EtUI4OunLBaiOTOpASU/AGITg0akEc5etP9ZdlVm5g68I4hp5qphDSexqAwZOMvnwWPIAU//KVS/i
	FC6TnKDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX1lp-00000003yTN-1TPG
	for ath12k@archiver.kernel.org;
	Mon, 05 Feb 2024 16:24:38 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX1lR-00000003yOT-2Wq1
	for ath12k@lists.infradead.org;
	Mon, 05 Feb 2024 16:24:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0B6ABCE0FDA;
	Mon,  5 Feb 2024 16:24:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55BB7C433C7;
	Mon,  5 Feb 2024 16:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707150247;
	bh=v7AU24VzKraCBd9j291earvac56Soww+i2i5g1Bnvuw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=nGh1UuRUeJrxTP+hguCUJezPFeTVkzHZVyBfTMid8io5kVcZyCddMWRVOu45s/G/n
	 D+a2MK4amj8FLxM9WV9XvFRTH/KNge/hbB4IsVyakeOKGxa6qwtCf5oannU9/bm1tZ
	 f1+8Bc0Kfq4G1E4KnDWF4LBcFNz6rfHLQlC+d6QMVtBaIMHGm79KUmMitDMzrEv6A6
	 oJ5iOPFA2KtBaJ64d8nSm9tpMTdC7F03mUUxMrE2HPVAsQZri7ZpeqEvw5b9J9FG6u
	 5WLPBZe0ocOpnyehmGBHHiU+ghtmNRWXIIUImiNd++WShTyX8l+xQcuXez6AT34B02
	 TtF32duCnAsVA==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kang Yang <quic_kangyang@quicinc.com>,  <ath12k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v6 04/11] wifi: ath12k: add P2P IE in beacon template
References: <20240130040303.370590-1-quic_kangyang@quicinc.com>
	<20240130040303.370590-5-quic_kangyang@quicinc.com>
	<f947f804-6fd1-41eb-8b6f-c562d51e5441@quicinc.com>
Date: Mon, 05 Feb 2024 18:24:04 +0200
In-Reply-To: <f947f804-6fd1-41eb-8b6f-c562d51e5441@quicinc.com> (Jeff
	Johnson's message of "Tue, 30 Jan 2024 09:02:54 -0800")
Message-ID: <877cjiswuz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_082411_245044_C27C8CCA 
X-CRM114-Status: GOOD (  11.78  )
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
>
>> P2P Element is a necessary component of P2P protocol communication.
>> It contains the Vendor Specific Information Element which includes
>> the WFA OUI and an OUI Type indicating P2P.
>> 
>> Add P2P IE in beacon template, and implement WMI interface for it.
>> 
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> 
>> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>

[...]

>> +int ath12k_wmi_p2p_go_bcn_ie(struct ath12k *ar, u32 vdev_id,
>> +			     const u8 *p2p_ie)
>> +{
> ...
>> +	ptr = skb->data;
>> +	cmd = ptr;
>> +	cmd->tlv_header = ath12k_wmi_tlv_cmd_hdr(WMI_TAG_P2P_GO_SET_BEACON_IE,
>> +						 sizeof(*cmd));
>> +	cmd->vdev_id = cpu_to_le32(vdev_id);
>> +	cmd->ie_buf_len = cpu_to_le32(p2p_ie_len);
>> +
>> +	ptr = skb->data + sizeof(*cmd);
>
> IMO better would be: ptr += sizeof(*cmd);
>
> Kalle can probably adjust this in the pending branch

Yeah, I changed that.

But I think even better would be to avoid pointer arightmetic and do something
like this:

struct wmi_p2p_go_set_beacon_ie_cmd {
	__le32 tlv_header;
	__le32 vdev_id;
	__le32 ie_buf_len;
        u8 tlv[];
} __packed;

tlv = cmd->tlv;
tlv->header = ath12k_wmi_tlv_cmd_hdr(WMI_TAG_ARRAY_BYTE,
					     aligned_len);

But that's separate cleanup, I see pointer arithmetic used quite a lot
in wmi.c.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

