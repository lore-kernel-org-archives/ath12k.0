Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42125C61DD3
	for <ath12k@archiver.kernel.org>; Thu,  3 Sep 2026 19:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rkWcLhed4axb1ETTzfibRwIceasPP1lRyAqmVQNnbPc=; b=iC9dNUVywuUNKwZqEZGL1DdtTy
	2zABR2V2Zk7t1KxwNi/clZmkHFaqUKc39UYUrf85ZBAyDS8CHolMjc6EyWNRDZ2oXAwYK2FNiZxPQ
	4IxrZUX3EifDmW3OEc1sneUPfmypsHB1Lh8Un46uybTjejv6nUdjewXfhJPIAo8G54MFucPYQdO19
	E2mUllK+L3Y3Oyb6qCH+/zR0Jl4hJeLYaoTXKLEqvjUwvmbQaQ0EZnFRPQC+ONwpD9k7iUTlKowlH
	qweGjMpjcv9L/VAumHVgsTbfDcnct1m9g4bs4jbWvGsaxmHjHG6cFz3Y/jSNV55voMvyReCZmW5Ye
	4YoFVFDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Ci2-00000000QLu-02l3;
	Thu, 03 Sep 2026 19:02:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Chz-00000000QJd-24V1
	for ath12k@lists.infradead.org;
	Thu, 03 Sep 2026 19:02:48 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3GbP417609
	for <ath12k@lists.infradead.org>; Thu, 3 Sep 2026 19:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rkWcLhed4axb1ETTzfibRwIceasPP1lRyAqmVQNnbPc=; b=ngt6apwglkjEcW1p
	mX8Ll8BhExG7U92lZfOAk1fbm/AwtxidMHfHlNjrkbP+ZCDnng/kfzTt1NxT1kg/
	n+13oPoNKV7F9D4KVlENTDSLWNETJOihSexjdA8lewQaH0eaGjQfPzNVqO3pZw1Z
	IIOKJ0sdX7OBEKLOTAhmn3oOwZ3HHtpTe1drxJRsU9EEQKo/HcDSoWNbBt+w0+HR
	02T6iXVreixrpLutjd7LFMOpPBPzG16VBwpqkKrV/1PUcctGuEjvRFWjaeaKQEBG
	yQCnpiX1MzPsdw3FDT/9pIAymBDU3E/Hre82fuEXoMQb4P/AhsB2Cck9FLrG0+f0
	p1JYeQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf51m2y4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 03 Sep 2026 19:02:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3968dfff779so197985a91.1
        for <ath12k@lists.infradead.org>; Thu, 03 Sep 2026 12:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788462166; x=1789066966; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rkWcLhed4axb1ETTzfibRwIceasPP1lRyAqmVQNnbPc=;
        b=R8Sf9RkClGP/WyaKXz+n4Ac5pLwCMW2/0j7c9nkg2sBiMy+69KKBBHZ1Wx6I6d9MH8
         uAyKhelNl4DhqsGopzYDgfhFMK5pLeF0YFyy0psJOzKu1IK06BV6obQr+Jt1Kiam9+/w
         RQjMwID4xCX8ARJeOjCBxAYJ3YJr9cmzF0/GrIKO9vgk5olTrNUZ7FzCeHjw6omsEJQa
         TZTKypfa08FkDqn5OJBKE2fDEc+KNyggHjA2Fqo8vuPyFIzlwPbPcgN/midWxaDKqoew
         /LPKcgSjTcvS/akrDIR2FFtFZz3OAeVhcms3vcK0yMlviCEHfBAl8vFTtQnMTnNhcllo
         oY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788462166; x=1789066966;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rkWcLhed4axb1ETTzfibRwIceasPP1lRyAqmVQNnbPc=;
        b=GqhseFNKzQk6TC1QhgjPDCqlF6eH+3oxouxsgX8DG3IAXFD0FAaOBpr1iog/Wd0buT
         Q1Bbh10WPIKay+GJcRg8Rb7Ak/kIKWL9GTfPv4pKdu0qsivw7yoL2S7NCta+fvWxMt7c
         OA3VAZOKXOnSyJ0H59inw9h3BGqR8L28kn2p5eyHSUwC4hhuHkUA/galCgDHpHXx1T21
         13dhHwcoNuTEciAsdQ+9/+jH3yT0bwxVZqfaamKurElVOy/PjE1COpE/1wecCTvmFXDK
         V5v5fI34IWIhmd1mKMns5dwcCCXuKWFBehDHazzf6mfXyOZixmFtNLoeDClFcoBb+LFt
         B0nw==
X-Gm-Message-State: AFuF++k+LARwzZDEfLiE41bLQ0cnkryDkhXN9YHKzAQnGiUgGtknHbAY
	S2qqiXhB209lPkQIQlE5A+Y3E9zUXU3v/TdKevO93IxM7jLDuw41RK80mvA2UbatVtol5hpr4ur
	iWaOUgotWxYRJiSwM136IwNOcjlpYX13EriuBeIhD+HQdFhP7OlArYjpPEImM4iS2/zDb17dV
X-Gm-Gg: AYBFou3utgZ9Dj0WsR3rzj9DrqDsRUBTNcPwPHBbsFF3nNVU6n7wxWIgAH6Kd1cKY1s
	wrf33UuAnU3V5SimIOwqkW6f6Z9k+P6snruh5shJ4OwfQsA+qmJE1CqScDIyC95EYQ/doPCNX5i
	/+zg+nIvPZMCHX5DI9Unkx1HKKGr3LZHlGUL0lJm7zfBeka8qdfiBHpG2cfWkYNZySUH0tTV6lJ
	zGqfbMMcZeATl6mguW1aMynSBB1B8yKDT8czMIvzfjeJtFJWieKebpXElLLMhCC/j7Y8k2/8oc3
	W3z3M4Vtmj40hiNKBdvRHYd/GukKb0ZTIEzyqKQrov8RqK3/tRfC0a+fK7KtQMPsPIX10EtDQhL
	OCn6vSI5AZWSX12XTFUsJsj6Dioz/VyzH67oiFQeqfPeKvvYU5zBlw4I=
X-Received: by 2002:a17:90b:28ce:b0:398:a649:8fa3 with SMTP id 98e67ed59e1d1-39b08799871mr8267087a91.23.1788462166184;
        Thu, 03 Sep 2026 12:02:46 -0700 (PDT)
X-Received: by 2002:a17:90b:28ce:b0:398:a649:8fa3 with SMTP id 98e67ed59e1d1-39b08799871mr8267007a91.23.1788462165462;
        Thu, 03 Sep 2026 12:02:45 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm1230164c88.11.2026.09.03.12.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 12:02:44 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <20260810-mailmap-v1-1-95129af871ba@oss.qualcomm.com>
References: <20260810-mailmap-v1-1-95129af871ba@oss.qualcomm.com>
Subject: Re: [PATCH] .mailmap: add entries for Baochen Qiang
Message-Id: <178846216459.824911.16096776966706744636.b4-ty@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 12:02:44 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 7L4zn8bqmHY83C0Jtri0AwbogHQsm9hB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfX04Ye0a/Jq5cN
 ZH23xVXxkQSCQD3kFIpYbmUZnYjyyY8+A6frnc1OdfoiNgXiO+3WEl3LSZeJw4J85LN5irXxQab
 f1K0GfUjn6OC6I8xa46ljJe2etTJFSAiynjulpINlgFBIsmmpe0cYv6VdvfVUvAeg1fVHHq+HTN
 c9j3hfazCdQ0FjIhYwFK1lnywbnP3WsrZAI32trC9CoLBpTKbnnr4+uKMnQmje7SSK4QCp5jyaX
 czkLYq08Qx9/2JHlWIESN/Es7qKtR9/oLW4SFIEhSxuwKcD4nX5alvjgc43nFHYHW1SJwiWJozG
 MKhdcQ999mDrp7sQhkHCDu9/4VeBcqUOT2wSz2yHEOVb+HWQRJgp09a5uVYQO9I5ot+iF/KRJLH
 lkt4oFRVRuG7BOuS3Xyd/SjYp8wp6BNtqt6nvdQ29HcrDtRX6mfY7+wlY4KfWmCCPLa3fOV0kWq
 pVh+dmTVVzhprhYzzCA==
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=6a99c457 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=W0KxIdkkPFcvg8SJft0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfXybLo0OPUeDjm
 gN3vsmCcCHmaEte82MLfSe9gP4RtZHFS4fW1egXQPdnTRADNGOkBWGtt0OLDTfl2G3XycWQDq3O
 vdKSHvu2x5pj4QWyVNyjiwMhRAtRa5s=
X-Proofpoint-ORIG-GUID: 7L4zn8bqmHY83C0Jtri0AwbogHQsm9hB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_120247_538960_5B677109 
X-CRM114-Status: UNSURE (   8.00  )
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


On Mon, 10 Aug 2026 17:46:00 +0800, Baochen Qiang wrote:
> Map past iterations of my e-mail addresses to the current one.
> 
> 

Applied, thanks!

[1/1] .mailmap: add entries for Baochen Qiang
      commit: 865b96bf16625aedfec8972d0528d370c245ff2a

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


