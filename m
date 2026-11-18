Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A518606A333
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 17:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iUMYqM3u;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aub7R8GE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DRpsgh7u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OaXuV6ft5/AywT1Mq8TBr2Se+xITEMZk1XHDX0N4VJM=; b=iUMYqM3utbks4b
	Iks2cNUSXgJSdO5pF/sqlhDVF68YdBemvY0bQ8sAQ42DM110ECv6jwAfZLYCz7GblZDUNLO4jvYvk
	M6Cpuxn1okVKgmYOjfh1UzGXfSgf1TwJlClJvE3sNGlui4yGZff+gaHU9z8cm+IN6LCiTjpMxN+z7
	y0AtZHcsHZXt4G9RizbhnfznRpb2wOIyLnt81u1ns9bXysQ8zsStR5Zw2e7Hdo3HbbIdQKVzWCrkh
	9mbs9kbRsEM4AA9fXBnFDb8EPBzkfv6Skmdt50YgKS4EbtY+Fp/PqaSiLddqr7NJv7iWACVEhKRpv
	AHo8MugLRuhZrLZGORRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj1j-00000009evN-3bUC;
	Wed, 18 Nov 2026 17:00:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj1h-00000009et0-1MHH
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 17:00:54 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIGwF6A4043659
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 17:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OaXuV6ft5/AywT1Mq8TBr2Se+xITEMZk1XHDX0N4VJM=; b=aub7R8GEHBIwKtSY
	MCJT1wFGCQUinCL94YDphQZrwb1GiaOGBX5x3N7cn5CsIjrPDxS6VyJwc1V0/T5x
	8axC3ovgZ5RZlEuPPnNlJ35BPnpXUqkknpo/tD8cNWwxU2DS+286oZdMGLpJ2iam
	fSuOMN96Se4JecYI3LjxomvZmejSwc78e5alnAmfdG3Q4ET0Qwl+1sCFbGOEf0Gs
	wthqtmXuDS/c28lwL5DcbCS6AFo0NWeM43qOYS1Y4dCyr/MdmmUj8hK7cUb4XAsW
	1icuwFvmn4X5ZaLiQzl8IjdJKYdOQduYuy3UK8Is0ok7aQaj+DDt3mV/uA7Yrosh
	/Crqlw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dfcrw2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 17:00:52 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a71dd190b0so3217462c88.1
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 09:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795021251; x=1795626051; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OaXuV6ft5/AywT1Mq8TBr2Se+xITEMZk1XHDX0N4VJM=;
        b=DRpsgh7uOJ3ieWyexTdj8sO/FQhchycwhwh+yeCurU9pMOi7x5GPvmrhUelY2Sfq+Z
         bueXVywfnNyrvMRqlGVk7KT3MNva8MiCA/dZQvTCqdmuLWAB7CRN/EBJ+YvthwdsGCAH
         SmSVgoTYo0YrUbxSEhHEcB44nqWZzJ9Ss822D04ppANcYFnnHzk4n/iSkv7N8kQuvjam
         7AAUx70HprdaIKTGESBW165oOGPoxz9LT7NwI2QPCABrfmSczJz1uep3ZxRTF6o9gepl
         1iKJ8MvRmT7EwArfaNwTW2PITblpgOSstuQKRHdn0UbP4oCP2hPIWFQP3JmxhwisAkU8
         9w5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021251; x=1795626051;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OaXuV6ft5/AywT1Mq8TBr2Se+xITEMZk1XHDX0N4VJM=;
        b=mbJqHtrYOKqguYjB/agacbcJ1vY/lSRa7+jOlrmhswSCT53ACyMF5zrGqKsj8R2w8e
         BDu5TX3P9od6s+rrp+kCReDMsXNuZRO3NXNjERSGtG5TVjQvVWe5588bHrL8AQmtVIsB
         JpRp7Hp6mXd66SylyrWHPPUC5qKcwroWJVhWaupoO33DsxCOyVMd5tsebESi1Pv5w6La
         s+LSICNDVfVldoXf2EYh6DAl+09m8p0raXkp6VY/O3kLVPZCHDHtMeUv4HJRASzzZV3I
         t9ELJ8+Ps4KyzzIEgyQwxCpn+Z/rXn9mKVhQFunSl7RpvO8L/DBwNpBgWB/w20jXlkaK
         +mAA==
X-Gm-Message-State: APuU4Z/tMUb/M9GKKseDstUxDdHWOierAt9h1PnRRcWrnd9zSAIhnWIA
	6xO5dUIBz7+GvocW65MX6eynysur4Y5P+0fxEfEoMTSQt/JQ7nRbDPyeIADHbUYs+OlnnHv8oFc
	KQ7kgBw5h7y3U4wFKBEHn6d+ZoyFCoDoO68hB+FK8pgB+YqnY3X26C3kdK/A71OUBPydhnHJy
X-Gm-Gg: AYBFou04LhomAvGeQEvkg+03N4P0AjJX8D0XNZpCRc++u60FddAha2tyRnW9ECqxBxw
	1HOXJEQa/9gatNzgN3us263uEGX3qad2D03/eTi7fg+RgGCXQhy7yuQXgGoudVf/rJX/EaSRNnU
	GHfL9JdXAn5DUTbFW91Jh+2xrone8LcRewcCRHAdTElDMO97RhsrKWL7GZPZcyscw7HbvtBz7WH
	ZvwOx0XGfrFucCmmA5o2oRuALTnP7hfFWi+Jc/SvwlDTz4x4xfYRRsFo9IpOQF9pddEgxKmS6a+
	2N9aCDUTwUxS8pT10RTVKT4GKSpaYAXmS5x0BJPceOdXbSE/n0EYIbJJZuk7VxPrCKgIHDkcRcd
	JG/hOcySCkojWrWxpj2ySbWLAldVwlQVsCUBBUTtgnurs8uJOFc7kA0AediO/Fb1xbkZdClBiQt
	2+pIHypr+sA1zKdis1CRhF6vtO8j5U
X-Received: by 2002:a05:7022:7f01:b0:166:af48:a2ba with SMTP id a92af1059eb24-1b543a1178amr2846922c88.0.1795021250819;
        Wed, 18 Nov 2026 09:00:50 -0800 (PST)
X-Received: by 2002:a05:7022:7f01:b0:166:af48:a2ba with SMTP id a92af1059eb24-1b543a1178amr2846622c88.0.1795021242415;
        Wed, 18 Nov 2026 09:00:42 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4e19sm11075662c88.13.2026.11.18.09.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:00:41 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20261118-update_mail-v1-1-81cfb6ff9ec1@oss.qualcomm.com>
References: <20261118-update_mail-v1-1-81cfb6ff9ec1@oss.qualcomm.com>
Subject: Re: [PATCH] .mailmap: add entries for Jie Gan
Message-Id: <179502124158.3425953.8143764068592380150.b4-ty@b4>
Date: Wed, 18 Nov 2026 09:00:41 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-GUID: WTrVCAvxAQxGJQX-TkCCNq3UBxPiAvke
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2NyBTYWx0ZWRfX5THkMKQwUuof
 +/wIhdZQEhrjzx42NnkBEWt6LObf0oxntRX8DG81YBY9U5g1vtUCVLJMWHlYSSclbiiFoslL2vJ
 tlARSu2aDJac3A+Fmp47h9wHlMmc5yU=
X-Authority-Analysis: v=2.4 cv=CdSdd7rl c=1 sm=1 tr=0 ts=6afdd9c4 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=tuQVG8UMx6REaIaWfD8A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: WTrVCAvxAQxGJQX-TkCCNq3UBxPiAvke
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2NyBTYWx0ZWRfXz/249spyN9AN
 dupZbNLfPk1iV0JLGIzq8cIOiQZ+7Payim76U+FnJy1UI/6FdrQ4VmvCTCyTDTUP+khrwqWqEfa
 zWvaH0+Wgm5WjRlPu/9uaYwZQUIwtB+JPgNV1EjTkjgauI3rVhUfBoZC++ek+0ChOgqZSPPkUEf
 AzIIMSHK940Hf1Gp1PsDWZfcgiZ5zzDGzBCFltkZVJNEOrGHeZmoSoSNFlL3FoLQli+JiwonSjO
 9S6HrCQ46mi5rO+SaMhyaQ+xM2XJ+7y4o4fcFrapQiJFOZH9nv9WqtlTGhpvKnQ5EiUfjOhdbMa
 55wd59wRRUbwNjg9jBIFwXBLs9krkfwxBRxT+XdbBVFAQoTFn+6CYey/mAqAmtc/Qf6muCzjSWv
 k2bGzpzBmwLmV08YSjkC6vp8AZT8Ema03Op8+MWS3SJKgw1lY9y4Cc/788TdACk9Q0pxog7kToS
 LlnbHYLEGzcjIgfH/vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_090053_772317_C9BFF1FD 
X-CRM114-Status: UNSURE (   6.26  )
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


On Wed, 18 Nov 2026 16:16:02 +0800, Jie Gan wrote:
> Map past iteration of my e-mail address to the current one.

Applied, thanks!

[1/1] .mailmap: add entries for Jie Gan
      commit: f8e9c050583bee4c7634ae46587aa7be3346caba

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


