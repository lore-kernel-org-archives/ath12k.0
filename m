Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3007BD3A676
	for <ath12k@archiver.kernel.org>; Tue, 29 Oct 2024 17:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TH0NGVZkkL5WFHk2sVDPDnpE34BEIdHVbKhZgMXAgcc=; b=A9sI+GIjTJ9RWh16K1L67RMxTz
	/XOR+uK1Qs2eTI8geRKqR5GikVejf4ydi1vI8TWMnRBAF5m+5RZh9r+PO7HS+vj/TSkF8h25nmJCn
	5R9dAv+Qjgx2sIYh7+1s5VCQCJD0u35beIvMuUkGgmIQa+tQu43VFI9RIoPznjJlHGlUB/urw6WY3
	pEKF3AkcrbA2dIx15WgzEEvizfKOZhwtrQ2hOTrs1dz0FVYWODHGgMg7pl74YWyx1J9Oru1KrHp0u
	XBSTsmtfUvStaSzAoHw6j6ofzUAnsWOT7X/HDBPlnFgPKpzuh6rhQkXTfkztwNpMljzb3iInuIHr8
	9Pq3O3tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5q7w-0000000FHWo-36tt
	for ath12k@archiver.kernel.org;
	Tue, 29 Oct 2024 17:35:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oYJ-0000000F1L4-0J3k
	for ath12k@bombadil.infradead.org;
	Tue, 29 Oct 2024 15:54:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	In-Reply-To:Date:References:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TH0NGVZkkL5WFHk2sVDPDnpE34BEIdHVbKhZgMXAgcc=; b=SE45aBsM2K8gkX+L4TrHbJDAHT
	yHfwGi1cEnH4Azf88SZAIq3tLd/rSonyTPuHqpjlBda3Cdjlnvl27PMDunQFvun/VjngvNFEdUp3k
	TUHbjeSXv9CN+trIzF3J+YIjWx9rReD0+JtvOi0vs0WChDbmKMumoenzTLx3a4Kf4UCzTmBBhKbVt
	1NmyY+5u18mnuZFBSfLHruCM4IXLv4+EMduEF2JKhEKPAbHTCDi88gVpDqWVmrhDeLQrvfd/mOeuE
	jnYYUZ3fuiBp/drH6gnjlW+XHERrlKPqW7N15Ym4VQSsgIDkYcaQ1QWEECMvCjI3ue0qALQ+1qQ3N
	XtQUxTNw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oYF-00000009wM8-2aqo
	for ath12k@lists.infradead.org;
	Tue, 29 Oct 2024 15:54:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 21AE25C4B9A;
	Tue, 29 Oct 2024 15:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14C11C4CECD;
	Tue, 29 Oct 2024 15:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730217270;
	bh=srsnDLnEeJ7XyGHDK/41YabXF9Jl8wpwJsAC+fdbuzU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=VvVN1yppsQiietu2ZuwKt/4AyemtAZZcILU4Wj/x2I3SA3pePbCN/hBwo+qsX28ie
	 g/m5ZmivySEUXRtO4UDOslmPtdG1S0NPQIrCFcplJCE+8YgmN/TZ2J/Nvza7RdTatK
	 z9+ncl+Pmn4gaTlz9SMNRaKxysUiyumo8BQfcnhEo5YlsnzGilhtjp2T0WDLU/jw5u
	 wdV89ZB7Gi8LdNAh1h2y/T6sUzIP2Zlwm0hrbqdoQ7bBCq9ioLl2pnv02Ao4eXAkr7
	 nn6nuyAA75ZDxqadufJUMPM4G2Dt78jFZWnqiOjpDbpwNHtmhPrNz9uY0qPsHnwtBR
	 5O4kFCqpyfNbg==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 6/8] wifi: ath12k: add multi-link flag in peer create
 command
References: <20241023133004.2253830-1-kvalo@kernel.org>
	<20241023133004.2253830-7-kvalo@kernel.org>
	<f8049c99-c7ac-410c-84fd-ac844041f34c@quicinc.com>
Date: Tue, 29 Oct 2024 17:54:28 +0200
In-Reply-To: <f8049c99-c7ac-410c-84fd-ac844041f34c@quicinc.com> (Jeff
	Johnson's message of "Wed, 23 Oct 2024 08:54:51 -0700")
Message-ID: <87wmhqgb0r.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_155436_053021_FA8976C3 
X-CRM114-Status: UNSURE (   9.18  )
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

>> @@ -1244,9 +1249,23 @@ int ath12k_wmi_send_peer_create_cmd(struct ath12k *ar,
>>  	cmd->peer_type = cpu_to_le32(arg->peer_type);
>>  	cmd->vdev_id = cpu_to_le32(arg->vdev_id);
>>  
>> +	ptr = skb->data + sizeof(*cmd);
>> +	tlv = ptr;
>> +	tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_STRUCT,
>> +					 sizeof(*ml_param));
>
> using the same TLV size both here and for the TLV that follows doesn't seem
> logical. is this missing + TLV_HDR_SIZE to account for its own TLV header?

I have forgotten the details of WMI voodoo so I can't really comment
right now :)

>> +	ptr += TLV_HDR_SIZE;
>> +	ml_param = ptr;
>> +	ml_param->tlv_header =
>> +			ath12k_wmi_tlv_cmd_hdr(WMI_TAG_MLO_PEER_CREATE_PARAMS,
>> +					       sizeof(*ml_param));

But did you notice that here is used ath12k_wmi_tlv_cmd_hdr() and it
reduces the header size:

static __le32 ath12k_wmi_tlv_cmd_hdr(u32 cmd, u32 len)
{
	return ath12k_wmi_tlv_hdr(cmd, len - TLV_HDR_SIZE);
}

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

