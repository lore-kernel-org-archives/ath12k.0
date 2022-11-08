Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C43C4332F
	for <ath12k@archiver.kernel.org>; Tue,  8 Nov 2022 14:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oZHl9oEPiL1RRkP9h6Kz07frews0xic2h4jiIX3364Y=; b=WX0lLc1VSP6G+0
	FJuuWbI8Etqo3SqwrmBRZQePL6gbfNWUO+N7s/f+Ypmppb+uo+AEFpy9kbVrCIAm1GuTcGwSCJOMY
	1s2H36n2XRxf1Ldu8v9ypZox9EzLRXpSOplRJGzcZJDP2Af9W5316KRiNeuZRm+sW6DTVRlYQ3dTN
	YAiuD+iG5TpEWQG9z39gcMywEaw76QDHHe8W0i1FfKGB70oaTGHigQeoDsy8K4s/QjuK+BzPIQ65e
	Z/9eB/386JY8xBfEyktTNk4o2jaIF3IWxj8Ci/LagayjNNsERopgjPg1s1EdA6HWj9OIh2vrZSL0G
	QmM42LlS4V+kqfKBilwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osQ27-006AAB-44
	for ath12k@archiver.kernel.org; Tue, 08 Nov 2022 14:56:59 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osQ23-006A8w-MY
	for ath12k@lists.infradead.org; Tue, 08 Nov 2022 14:56:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 8E7B4CE1B98;
	Tue,  8 Nov 2022 14:56:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14053C433D6;
	Tue,  8 Nov 2022 14:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667919408;
	bh=0sUdFUp/JKQ9HD+qKj1AlZzNDG4QGE5+QW4W3Z0QinE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=cQ5Arhwj6EV5XWKF1BZI74UsQoPLbxsS6E1jEKPpwXl9a5AF+334XvMLF4DVurm5+
	 IBNNcyTA9WL/HHzAOkUEuwzN7w1DDrCZ7Bl2PrDirOwFeZpcggfLwHQDMDeK1F+roO
	 fgBPpnuESS5R23ceHLO/cWUlJDwJ7U8iTwgtMlvYKnileEqCruNg56vz/GOtpsQckT
	 GdTQSevk2eszZIYOD0r+xWVuclx0dI8Nuwd1QRRf8tk6w+boUR5Ok3ORDMvwSocnbR
	 PsJz8l8PRzdONw7Yu0KRp8BzbDyxBWpMyFlqFdNJlZNf+FDdMb1w7FItMa1pcRgWoh
	 6gHNdcV89Oudg==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <linux-wireless@vger.kernel.org>,  <ath12k@lists.infradead.org>
Subject: Re: [PATCH 36/50] wifi: ath12k: add pci.h
References: <20220812161003.27279-1-kvalo@kernel.org>
	<20220812161003.27279-37-kvalo@kernel.org>
	<d6323a12-0a7c-af50-7fc6-d996eb24a02f@quicinc.com>
Date: Tue, 08 Nov 2022 16:56:45 +0200
In-Reply-To: <d6323a12-0a7c-af50-7fc6-d996eb24a02f@quicinc.com> (Jeff
	Johnson's message of "Thu, 18 Aug 2022 16:18:04 -0700")
Message-ID: <87zgd1cx5e.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_065655_925492_FDDD19F6 
X-CRM114-Status: GOOD (  15.34  )
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
>>   drivers/net/wireless/ath/ath12k/pci.h | 132 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 132 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/pci.h
>> b/drivers/net/wireless/ath/ath12k/pci.h
> [...]
>> +struct ath12k_msi_user {
>> +	char *name;
>
> should this be const?

Fixed.

>> +	int num_vectors;
>> +	u32 base_vector;
>> +};
>> +
>> +struct ath12k_msi_config {
>> +	int total_vectors;
>> +	int total_users;
>> +	struct ath12k_msi_user *users;
>
> should this be const?

This is fixed.

> then the following typecast in pci.c would not be necessary:
>
> static const struct ath12k_msi_config ath12k_msi_config[] = {
> 	{
> [...]
> 		.users = (struct ath12k_msi_user[]) {
> [...]
> 		},
> [...]

But I couldn't figure out how to remove the cast, I got compiler errors
whatever I tried. I added to todo and will revisit later.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
