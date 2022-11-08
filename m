Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3701C4332F
	for <ath12k@archiver.kernel.org>; Tue,  8 Nov 2022 15:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aVrJvJhnms+UiidPR05ATcHyf5kiQOH6G5Dlx8SylD8=; b=LlQ/ygwFKqL7sy
	9ph+VLe00gof8J95uKpBmWP/gvtUzLylb9LUgs/OLw4oNncBNGuIx9otUCYrmnUFRqKGOPy9oLjvT
	Ue1FztsXTxqOAkf5Yaz9Flq8GjGyVbr4OL+0UdWlB4buVAdeJgR56K6YV+TMpVCekqdIZCwYRwZ9V
	6tJLwxnVN8wucQRPiy+WIDdjV6V3eznA4BF5MXLFUgR4bVlOXwmct2VbFvEI4NxMDUre7AJEWAWWC
	+AY+SVSmkkp+zcekwtpsllsMu+bPpL2rCR0xdqZqdVMjiKZXuf7Q0R2/FhxLGUniNCWRXlfd5m3Bq
	zdWrCR544Lsr1t4VS5qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osQEw-006G1s-9Q
	for ath12k@archiver.kernel.org; Tue, 08 Nov 2022 15:10:14 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osQBk-006DzH-Tv
	for ath12k@lists.infradead.org; Tue, 08 Nov 2022 15:06:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 061CACE1BB1;
	Tue,  8 Nov 2022 15:06:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7256BC433D6;
	Tue,  8 Nov 2022 15:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667920013;
	bh=u1C3QwRl3T4Sh0lHCyPvLvwdjoMtrYW+/j3HiFizy9s=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=OcXhl2Ng0t1yvwqkf76jvkYSjXvqAyu0/LiVmN3CSGmUiWVG+SyeIKebeuXvBUL2J
	 3u6Jc8xP1ysPhjdQJLY6TqzC3fr2cqZtbwirtKhpexEu2CG/TEn5W7b/Bn8wR8C0ik
	 HPVWYQ9Zti4JoOkrqcKVFxs0xvhqAhRGmAjOSjrp01QPNTFAeRXyFu5ObxuN/9G1y8
	 eSkKZL8LqDx2Rv7uLai5NYXed3idmKV8aqw8AqyENYNEQTG2dT8q1crWumaEARk7ae
	 3HRpznqZ4qgHT5Kd4QbUXsjVeU4xEIrc2tc228+Re5HIC1XUsONmG36rDI75dbiplS
	 g56P4MM84jWhg==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <linux-wireless@vger.kernel.org>,  <ath12k@lists.infradead.org>
Subject: Re: [PATCH 40/50] wifi: ath12k: add qmi.h
References: <20220812161003.27279-1-kvalo@kernel.org>
	<20220812161003.27279-41-kvalo@kernel.org>
	<f6e2c694-4803-be69-ec05-08541b718b8f@quicinc.com>
Date: Tue, 08 Nov 2022 17:06:48 +0200
In-Reply-To: <f6e2c694-4803-be69-ec05-08541b718b8f@quicinc.com> (Jeff
	Johnson's message of "Thu, 18 Aug 2022 17:25:42 -0700")
Message-ID: <87r0ydcwon.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_070657_174575_BB81890D 
X-CRM114-Status: GOOD (  13.63  )
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
>>   drivers/net/wireless/ath/ath12k/qmi.h | 610 ++++++++++++++++++++++++++++++++++
> [...]
>> +struct qmi_wlanfw_ce_tgt_pipe_cfg_s_v01 {
>> +	__le32 pipe_num;
>> +	__le32 pipe_dir;
>> +	__le32 nentries;
>> +	__le32 nbytes_max;
>> +	__le32 flags;
>> +};
>> +
>> +struct qmi_wlanfw_ce_svc_pipe_cfg_s_v01 {
>> +	__le32 service_id;
>> +	__le32 pipe_dir;
>> +	__le32 pipe_num;
>> +};
>
> curious why the above two structs use __le32 definitions but none of
> the others do. I thought the QMI interface would use the qmi_elem_info
> to properly encode/decode in host order on both sides of the pipe and
> hence we should expect host order on both sides

That is a good question, I was also expecting QMI to be in host order.
In ce.h I see this:

/* Establish a mapping between a service/direction and a pipe.
 * Configuration information for a Copy Engine pipe and services.
 * Passed from Host to Target through QMI message and must be in
 * little endian format.
 */
struct service_to_pipe {
	__le32 service_id;
	__le32 pipedir;
	__le32 pipenum;
};

But I'm not convinced about that comments. Thoughts?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
