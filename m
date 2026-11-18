Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C78C606A320
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 17:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OMwHofY9;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e+dvvGEq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AD2q3dRt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7zs1LyhgGcxguGsee2P1ca8eeB+ID7kcjFTY6w9SYYQ=; b=OMwHofY9bzdbKO
	v+79PatSFOUkwYH4EXDA1bB3Y2pMEFz2ZwzhaEoMGP/wuo14AC7n7CHI/hUoPuXx8FZtFS8nowtDU
	O1bZOpKKp759XodAzuVyen85csurX26AmXbkGIYhFkKgc6YFKwXvHzz8sgczame8F8mL52Y0OVIET
	yeR/OkDTJ+zaXv9XHbxykSKH7aBprKIgW8Atsuepi5ybFo9KCJ8Q5IcqQGfMhIfdel5QpajaQjgAq
	SP4PdEv0Qf5L3af5ktXpXA7JYIb7h+PXJYnbD7VeiqZaRcP5aafSYRRJhmHKwrMsPHxUh2lnu4bqX
	SpWnDKs/yXWQi/y1yLDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj1j-00000009evY-46rp;
	Wed, 18 Nov 2026 17:00:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj1h-00000009et9-2iP9
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 17:00:55 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIGwjCd134694
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 17:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7zs1LyhgGcxguGsee2P1ca8eeB+ID7kcjFTY6w9SYYQ=; b=e+dvvGEqpJkTynSN
	iIk1sXIhWSPHVPWBN0OKSAHHBvU2B3jL/oKPWBh4m2Jo32k0lZID1bpCVg6m8078
	n025FhCtBDMOZ1pACujsKXEnBdN7xRwiv9qiHka/m6XG2i1pyGWPLk8Bkul0P98f
	bebqv5Z8FvfCZU8RjqQZ/IBHjNlAWfzaJLZElfXi4HeW9nQnhYJG4rLc0/OMKf07
	UxdVSpSo1UZfiBETI04Aj0Z1hyoErSply+CZfuIfydx7PN3C7CUtVHkKMeaQh7hO
	m37rubF/jQAV3uinrHV//v3Q98Thnl8ojSqwnNn4hNgDz8UKqts07zU+yNXm/b+e
	oepj5A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvav5bw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 17:00:53 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3817a0ffd5eso2878eec.1
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 09:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795021252; x=1795626052; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7zs1LyhgGcxguGsee2P1ca8eeB+ID7kcjFTY6w9SYYQ=;
        b=AD2q3dRtGAq11eTuN9OPpUEOqMWeJMyJa4FhfaohOoAY5+BUIqQh8C5yunxsotsJtB
         qb90QkHMq6sxzAqeGJOlr5L921CYgvuDbS8jXd0esrFt04tXoIl60kSFCY+M7lcdkSph
         BJk8xmCDtfLXZDU8r7EiW8CjSmoF1aoAQZIx5UM4MSfIxB9+4yOY7nNdfoDJ5qmTmlKz
         zoYug0TgMeTUyCNtUPURrQaG3lTtJbaKw5/m7lBBALKm8ERqpQQEqOqIDULa4ODqd3wc
         Jxz5WBBJBkpZFP4eaWKPIbkc/5J3GSP5J3P0GYDFnBRL/OZzPBWOU+JgSvNPndRRuvyM
         Wt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021252; x=1795626052;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7zs1LyhgGcxguGsee2P1ca8eeB+ID7kcjFTY6w9SYYQ=;
        b=WR8IDtD91jjwgmB0Sybdbw4dcjFfdIZ+h6LTvxRj+7U4lWW8sGFC+oYMHcubAU3VIn
         S024g5skALaPwnqkw1FogmxMxeY6bDKbS2aFJlIW94jBhDP+6iIv0zSk0sm6/bULMFgG
         Iwf0cWSKRb4fh7BqS5CYiGV/4oj2h7OUr7Atp0O6sm5VSeGfD1GPJIX3nQT0mIcT346i
         wu0wYHFCqCx4OaH1Tb3Bk+F0ffo6gDbd6+Errao4tUotMd4r/o4MERnCOLAc6+y7vW/H
         oJ8NGeL2syc5N+1gNdh5H8J8+EfEsv/UKGaLUywW1yuxeu59S+9GttRz3t6Ce0luVxh0
         CE2g==
X-Gm-Message-State: APuU4Z8buUhDW+3wWCsIQVeEP3gy6/2kDjiPARTRFJGLDP2a3W+RZiGk
	QhFGsalh2J5rH7kW36zcRYzmhUvMgruRfjbok4OqRsIkfPK81aN9qcY5dPoiJUapgAguR5GZ4Z2
	jOc+8TLrKRqMLfl2Gs7noVHueSTVo3xHJGCNky/htoMvaxSUI7wzU3qtN2mJK0xs5vCt6VAuy
X-Gm-Gg: AYBFou0stDvpLzIIm7X/fHducCt5SlVvuNd6qhaAa6Xw9cIKrbD7TVOR9xL5R70KjX2
	a9ieUBe2tlHwc7MXOzi43U6Fl9vAAJje8It07mGhvhQ5LYF2DocxC11zYap6mAiKfb7/Yjyjo3g
	LP1WWYm2E7QMNyXOpCwUZnu5sbPrVgLCrUZljtEuQBZhus9hFWkctR5GpjRacVc3TrkAWYYk0li
	Gz1Tj9SOsEb68CtlcY3r46AL7KGsqo2/UndklyYJ6Vsv8xAtu26617tYaobgl//aT1ULgUoheta
	SRdliIt1V7J7/hocBWUwU75j7oYmjxUUv9WB01q+q4Eqnz1SoMk6mSKhYjPO/5LaPR+urv+WaN9
	NhKGKYeme00j/QmZm81t6Eum0XrCeMwSuFLveXBYyWnvMarqBnGlFW/qSJZUXtNB9ErzcYyL1ai
	b9rTkeY6avGJ38tFiPo/nS4L99OnTe
X-Received: by 2002:a05:701b:2319:b0:159:f192:5290 with SMTP id a92af1059eb24-1b54cb80203mr39848c88.13.1795021252246;
        Wed, 18 Nov 2026 09:00:52 -0800 (PST)
X-Received: by 2002:a05:701b:2319:b0:159:f192:5290 with SMTP id a92af1059eb24-1b54cb80203mr39830c88.13.1795021251438;
        Wed, 18 Nov 2026 09:00:51 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4e19sm11075662c88.13.2026.11.18.09.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:00:50 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Chunkai Deng <chunkai.deng@oss.qualcomm.com>
In-Reply-To: <20261118-mailmap-chunkai-deng-v2-1-a5a5a7430663@oss.qualcomm.com>
References: <20261118-mailmap-chunkai-deng-v2-1-a5a5a7430663@oss.qualcomm.com>
Subject: Re: [PATCH v2] mailmap: add entry for Chunkai Deng
Message-Id: <179502125010.3425953.3484874434661264575.b4-ty@b4>
Date: Wed, 18 Nov 2026 09:00:50 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afdd9c5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Uby6fhODo1G6y8loLmkA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: mUQnrHsQkBKo4aUAxoOMTPMxuH6gszYD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2NyBTYWx0ZWRfX7kpZUEsfWlUH
 EzLfMRg4WPTY0SpBQRVftT9YK1wguU86NmKKs65MA5U/rFK4f5tUywGCI82Uxjd4WfZGnCyPoWX
 BbEbbCdTKeNwRhTylHIHxqvTH7bHlIn2PpD5nyOclAmLafjdjdhs0P2Gte5vDw8BJvFXOXiBFAo
 atwLRvnqtJUqkYP3N4ztTvaxjSZisncoh451WpDtHcY+ShWf5PfcQHs85eEewmgRJS/NMmQ8ykE
 82KaW8LI1mf/C5L3B20tKyLHo2cQXuzny0yPANg4BGQQttl8SBxy42pr/C5UBQV6uuyqnBNnsNX
 uZ7wXWBIShIImR2RvM+zCcaXUG0T3p5xjWXH46PjhSIFX2fGLaTmLFwCmPsFizyJlB6jvvbJmnk
 73uYPJj1YeH0zpyvlOoR0r6RnwuOggBYJQN20TmkpSb9Oa2OxjPm8OwEVbKOtXNqHxGmCyuP4Ky
 8jv9XCW1plCe5WAh3cw==
X-Proofpoint-ORIG-GUID: mUQnrHsQkBKo4aUAxoOMTPMxuH6gszYD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2NyBTYWx0ZWRfX0qH6vUAsjaio
 HB0vRYxi46nLXnbtiUd7K1Is8MkaDSWTjXvTupcOqii1m+SNCnhITSwLtNkCqxlC0REBLwMrYYf
 jCFoeQnpOBbiI9qITlxcu3MEJvPIoD4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_090053_772311_D5A14C26 
X-CRM114-Status: UNSURE (   6.41  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 18 Nov 2026 00:53:57 -0800, Chunkai Deng wrote:
> Map past iterations of my e-mail addresses to the current one.

Applied, thanks!

[1/1] mailmap: add entry for Chunkai Deng
      commit: 4506e667586b1a4ed49e3cafd6ffe9eb3ed40be5

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


