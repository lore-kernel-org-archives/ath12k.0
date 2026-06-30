Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F12C43458
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 21:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MAzaYVsUkGuytF349XwCOUWCbbCHXOwSdhtsx4FTc7g=; b=XJkIeqEwC7W4KKCD1wi1ReRsmD
	31fJajd+S7AC0QcrHvB8fUXbH5uzUCri6auJYg86HmDQZ401ZD11i/STAmajz3ANgaa4XrvlR6ehK
	e3fAgTL6dWRjiOtusAaO89LOhAXgVgHv0lx4btiEXLmtnJPXXsk/3v119WvubbUL/R2wYDGsSMjFV
	ls3IDERQoRAvHCq3zsbXAHVhJMtsFvacSOeme4H5+sDBYU1G/aXVEmsqctHJbahNdeKzyMsddyRDa
	w/P2VZEbfo2Q0nQDdMJ1NvXQIdcjBpkE4qeOnUJWDrTe5TYRowVNzKL9oKkzbdc7zNvbuAsCKLjV6
	1u/79Vmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefye-00000000ErL-15I4;
	Tue, 30 Jun 2026 21:26:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefyR-00000000Em9-17N8
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 21:26:34 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDojg2960152
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 21:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MAzaYVsUkGuytF349XwCOUWCbbCHXOwSdhtsx4FTc7g=; b=bdRlwRdXpAA0aLOn
	8icodGVrfBxtIfQrwVoNJ22LiGastf2KoeNdlCpRrlxcK8f9IOY8LHSi9GKaMh2/
	Nv7WwaT8d7ZZ4uyqQHFxMJJx18W9SGBwJccvcEFWAmFoLC2tJM+geY1AWUPDDq2z
	0CjMT+C3MbIN4D0jwkdL6dW7Q3t1GIQpRVbABTUD69HcShmL+INSYzLk444gTGPT
	1ZawjTdNJNlGX/Fuq6YT5gMyAnbet5Un9uVwttISHqagvNUdXmUTTE4sJl2aleE4
	NPIjgnvDmmxJw/uXH5FwGNl2auhg0rdqysVo961TTRJhHBiYhi83PV1gN+uKzq6Y
	Df68Zw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4j91100j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 21:26:30 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30ba395b047so332099eec.0
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 14:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782854790; x=1783459590; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAzaYVsUkGuytF349XwCOUWCbbCHXOwSdhtsx4FTc7g=;
        b=PruU1kB3ZH6fdiAAdVG+KVJdyp4CH5tVXD31hwCtejB88yhFdqwEdh1WADfNYoUBjw
         Bah1SMSp0a51QXJVDzRfOe9nB/08AIoeDEJN/3vi9cqnQ7+LRJHwjvCRUUsOnmGAPPFw
         RQjCzLH1reLWABmMKw89OVyIJ6DWSIxn7b+fOntUo3vyvdJeHqrjQniTYg0adrXYjFKS
         us8AhStTcVuEeJJ5QEWrCn5P8xzBk60GcUW8l2RV8iRneFoSsLSP7dY4GEGk8xGELKYS
         AcKfpX3InNNW7pywiHfuQG+UKuP3Y42D1nDypeRZM6I5v2usTby3eNRhGcHR9EjncDTg
         SF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854790; x=1783459590;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MAzaYVsUkGuytF349XwCOUWCbbCHXOwSdhtsx4FTc7g=;
        b=NPRfVf+ElDmBgx2ppOIV9YEdYnKiVeQYU5/8CUgsISrCdM0//95gG8MjLB9n4FqftN
         oSslZw/J1ttdVDDkMHhgsezH8NPp7fm5FgUESzJHxSa3KX2wtOe3x+rocOgIr0DyVSRE
         JXwxK2sqjmP3fEXimpXwy1ZPF365wrcdJ/zhNOri6SgJ7KTV74o9/cqBRv7cA3//ki6J
         1/56UrJSmQAfbvcEEeswRWJGqefXhXlLS+X9lQhR0htzn3mxS0AGLjff02r6hdTiT72E
         /+HytpHfqZypTiKj9KUnGfxg2sC4KB8hLKdfxG/hgzUAVgDF9AVzRKMaNztDoUZ8L5mt
         r+Cw==
X-Gm-Message-State: AOJu0YxzVCC16YESBoYwHUrOHOAZOPnvL4dCPhK5Nb1qIkjA+9grHf+N
	hYM6Qga2ZIvsxOfdX6UAU2zOZ0/ZxxaJQS10PjPArL3umyKlQPyAxn+XAYiDfSHi/HP1lhgwVeE
	/h1KAJWFizA1/TuioD6KD2H7rFfHID67BZLiliYKc7Lw4pX1zj6F2xssH86690sQV
X-Gm-Gg: AfdE7cnWi1F259l5wirV0wKIGyFXU9uW4pE/G2ViS3sCncOKi2g/GLch0l0cKZX0lGu
	mZjWgfaFLkr791wAWWVySMDksrJCQciVZuezR9Rz5KdxW8FrtVxR5imfdJKLDscbz3gZ/P62vYu
	9Iw1N5AYI4ocfquDAbM93k1dZc3R2HbieyR9nar84KVrXBKicnjb4t1xYplVoGSqhZ65E3OF+s+
	Jn36jtdXX8ZSuTmSkvM98y2ib17e8C4biiDGiqHjsVOts9o4PZUp1eweKaB0axlRbBYgXz+qFqY
	q79jIPLJUFYQeisAkXr2jJnZQd4cdbHz/f4MMUEozSbHMkEikpVS4uHrA3k9WBIPl+6x+kmOtLT
	ma/PFKyE6NvYZu+D/i0nLVgad3kX0LKxFhr2KUCBx0vZfb60R9c8co2/06DR/KpyjGg==
X-Received: by 2002:a05:693c:88c7:20b0:30c:9f31:b631 with SMTP id 5a478bee46e88-30ef09b97femr1230240eec.33.1782854790155;
        Tue, 30 Jun 2026 14:26:30 -0700 (PDT)
X-Received: by 2002:a05:693c:88c7:20b0:30c:9f31:b631 with SMTP id 5a478bee46e88-30ef09b97femr1230224eec.33.1782854789562;
        Tue, 30 Jun 2026 14:26:29 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee300b286sm11604046eec.12.2026.06.30.14.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:26:27 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260604031551.4178754-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260604031551.4178754-1-aaradhana.sahu@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: expand UserPD ID mask to
 support up to 8 PDs
Message-Id: <178285478779.1590147.7383564492377283183.b4-ty@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:26:27 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: 3X85D9qMWLVoFA7oXCMAlZwiuIXBqub8
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a443486 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=GeFKMj_w3zxWA0NedEQA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 3X85D9qMWLVoFA7oXCMAlZwiuIXBqub8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIwOCBTYWx0ZWRfX4Jnijb5d8zS5
 XXWzyBN8Y0XQ7q6h5vjEuxsWIXHJh6iLD8Y4EgeB942Yxq8PxRVgiPbHP1ZLIIjmdRMRtgnhTG1
 S0eeRs6kjx4RCO/6NYnlTJRsN7YXK7WgQS6I2nGrb+RvvTlT9ydm2yBD4Cz739HxtnpKWc1/jsT
 ZEwrCf+nk976YZkT4fpwNj+5acyL5dUmixA72Hb6P1UlWKtekwFAqJcIGIP8dt4cK3A7/fRLRMc
 E8kQ2u+Mynt1F1mgK3q/M7YL40pgeEvHYTIqzCg17GKJosCEmtzta3NGBoid1AL/d+QzKkoPDES
 B0mq3J9mE/PhYQ3FFFqxyInGlSeviynCixdg/bGg8oOWf5EUrU7p1ey9QnJB3oAwDSAY1u0WxRa
 pJbrb1L39BM9WhVJYyA2X+hZPMImjwBXHDhNu3Bz2CL0wLRsEEeb9kO4NOd0g5rimcf/nY3rZ5m
 STdiXnhi/8vgqkFDXzA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIwOCBTYWx0ZWRfX6k803U9r68DE
 mDCZoXnGZfH/U7S6byfdxXZ+6U1nBQ/tsrQREQfg1Xsrkwok6yKrIdy6lw6Rbp3AXd6rR0XcVUU
 bjAFm9OMrV1A4mwL8H9Z5YYlz/Drd5Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_142633_118930_D0499A00 
X-CRM114-Status: UNSURE (   7.20  )
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


On Thu, 04 Jun 2026 08:45:51 +0530, Aaradhana Sahu wrote:
> Currently ATH12K_USERPD_ID_MASK uses GENMASK(9, 8), which defines a
> 2-bit field and limits supported UserPD IDs to values 0-3.
> 
> Future IPQ5332 multi-PD platform variants support more than three
> UserPDs. Expand ATH12K_USERPD_ID_MASK to GENMASK(10, 8), increasing
> the field width to 3 bits and allowing UserPD IDs from 0-7.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: expand UserPD ID mask to support up to 8 PDs
      commit: c2d60ab8e3827de2cbf951491e5de339e4bb2eb9

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


