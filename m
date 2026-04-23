Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE436FDEE35
	for <ath12k@archiver.kernel.org>; Thu, 23 Apr 2026 18:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+MAGwJytPEBGybgc2cfrWBTxlewcqZOcmpxm/HgRFBA=; b=XZo5PQ0k9Zss6MNku3V46C7dP2
	M1SQpsxCjyuen3cgzoRrsiD2xbIr1auQ2ldEeAGJ+NuyQqAsgiFfc67h5rOrEjVDn4U4KAXd6RMHi
	rxURhHwKvGMZxD4iqyHIdx6n6lpMZX2nlhViMxGUTG1IfMv6vtJxGSixh3ne7UfUfASd1zcDmz5R8
	875E0BhYPcP5Bs+ML83p2+5iqf8oR3YiR0Yb/ZmN/Dm5aiWPuX788yCZSqiWs6dGgEGsGqcRbMv9U
	H1qasY/6pFqjLM48Kpwm5F9ToAACRC+uYobZLgRqC6/QvNkYo5mDyNkJ13Z5diYqS5j0vj+xtaQn8
	pI04Cvfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFyMK-0000000C5mB-1rRa;
	Thu, 23 Apr 2026 18:01:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFyMF-0000000C5kf-0rVz
	for ath12k@lists.infradead.org;
	Thu, 23 Apr 2026 18:01:03 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63NFZQnI179312
	for <ath12k@lists.infradead.org>; Thu, 23 Apr 2026 18:00:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+MAGwJytPEBGybgc2cfrWBTxlewcqZOcmpxm/HgRFBA=; b=TFnQai6RyrOqnnuP
	P5OGshjc7nJrC5CxCBdEEm1FJMJ4fAejsoohhyBOgXH0U0juEaW3GVmBOm8AlWow
	T10wZgD25EJyWsMEDIhLc8M8FKdwrxc7JNhmphuQtrOq/jRjHk5syUf3+IrzRVHS
	DbWptc+eLZ+7D4gOCBG0j74mSZxdBHWZSNGswLZQJUEgOuVPuEtBUuHEyppO0T5A
	cUWohbCR2VaxEgI8EtSAhNH2/rjxtBNEiFK7usR0r0WFfo1GEk3bbxHsBljX18ME
	1OcLPNyAlrVijz2o9eSo1ubfRFcIdoqFj463BliYD8IzSL4mzX/n342+2WsPSxnW
	ddo3Ww==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqe62jv97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 23 Apr 2026 18:00:58 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2d93379001eso12405478eec.1
        for <ath12k@lists.infradead.org>; Thu, 23 Apr 2026 11:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776967258; x=1777572058; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+MAGwJytPEBGybgc2cfrWBTxlewcqZOcmpxm/HgRFBA=;
        b=A+8uOEoZ0X4P+S+LRLnkrLc23XzWk9kzgzNraVG6TU2FkhB//urPGaRmwaalrfsrnR
         UhLBbqyO+Du2Momf8Q0Pvm0XPnGZgOTydXJMbv3Z4nrK3mFO0XjqM7r9T3yEPlHLGtjx
         rsSFt8yXHKVGzH02U75I3FmvbhJwN4crGeMCMWipR7z7SgnF2Ca5oVDdn+gACkB5Q5k7
         24pORh8CoTTE974GIwKgpEyNT1pvj6HhVgztpafbAjDVQjqGV9pHjb8srLcHINbhCs5u
         o+hGoe0lr1XIyB4hwn+3Kav2Dj1cOAC8ErsJpGmkR2do0uU/kRXw7CpjcJMq+fXRZovv
         TXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776967258; x=1777572058;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+MAGwJytPEBGybgc2cfrWBTxlewcqZOcmpxm/HgRFBA=;
        b=QnWQXqGL6JgneHG/yF54c8DLT9ieP5p6FGwDe8QYi85bYizAVcOq4mIUyWE/uf0YJ3
         t0T8BfiT8LAdWB/GdBGFwmrWn5b+QJwcgg9wuVdsfTJAwsxTL3Diyxmzc2swkSi4awj4
         xpLrM8iTJegUYvy7mwEodnP9hJlvoPhgt12Lm34INsoZa68/HM5ev0217QgSzvXagcd7
         JmGebsj3heLETLvyYwkyahFVu/hS55R9mo94qJcm4uY5QHs6eqiSrY/+iduczMUXRllG
         TzvhIHxybhmZdMu9ubv8sU0gHCI1EcKaEmsqrynovyJgBaM9SITFI8s4/u9XakvQE6Nd
         zy3Q==
X-Gm-Message-State: AOJu0Ywcu+RzLdvVDFTKJEnGelnKgi3c0OYdXIT/g/eyvmTMzzuTFcBC
	KQy4wSxWx66oLMKn3NYk+P7umJ8LPQh2H1pYQMZZ/tgfnBk/yLg8qfPJ2ziPHvTYp2j4l6Icxy/
	M8KfDDpEJix12IZlWVzo4yY8SKip2pfG56gJ25pqMcLAvlN+b/TFLvfuzHg7ujm/g
X-Gm-Gg: AeBDievg+Ztr/h1Sdn/c/8grcSMaGYdGnSUjahuWtbS6fNV7AWhmMc5/6m3fZsNn2hr
	3FfdlaJdHv1HWhMmClGLleRtQvXVghOp0P57auajZHL0w6Qj0lIeLKLflgjXPTfuoND9WUlIMNy
	GS3cqbJXmlOSYShOpA0bAWJm0AxCm462Y7ULc+3WZVDW0ya8myji2CcvXoEq6f8aDGLhdJoRMHp
	XJaRYAScAo9/p04ehou5pUVjoAxtZnp/hYh08aj9uHtQXT+8Mp/nJC1+/X4nRRDGbyCRg9nq+08
	LBen9100gSKUS+DzVUH4dgyeW9cNUHGK1kIoI8UJGBRGHrg7+NctjijX8ZVnM8sVCjNzsW9NQiy
	R+XZOyocKlSWURs1yPOw4f2nDCmsVHr3u6OeiOijgCJ39vr1/ftwMVvUTpg0BTjr/7L4qo18W5T
	lLHmCyccAFh88=
X-Received: by 2002:a05:7301:4185:b0:2d9:fa9c:87a9 with SMTP id 5a478bee46e88-2e464ea79b5mr16138607eec.5.1776967257809;
        Thu, 23 Apr 2026 11:00:57 -0700 (PDT)
X-Received: by 2002:a05:7301:4185:b0:2d9:fa9c:87a9 with SMTP id 5a478bee46e88-2e464ea79b5mr16138577eec.5.1776967257076;
        Thu, 23 Apr 2026 11:00:57 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa244csm27867887eec.2.2026.04.23.11.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 11:00:56 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260410071300.2323603-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260410071300.2323603-1-aaradhana.sahu@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: fix OF node refcount imbalance
 in WSI graph traversal
Message-Id: <177696725615.2493545.11975303752151974707.b4-ty@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 11:00:56 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: ObreoVBRlDso3bkcBwSsDow8qwj0uJar
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDE3NSBTYWx0ZWRfX8e5OmnmIOAXc
 K3opPKfe/uTDpwmRmx4N6QLpLfUXWNxIvyjWiMgB2c7rBjM5xlSwrpMrBn8mEvqT5syUeQC19pf
 51VqbN9fjKv5Hmf/he0XzyxTKWbH4JqGXgGJwNKMXQpeOvrGLtNGAYKBBvqOHOgM28pB4nYS0H6
 uWssgOhE1oP/0Brj2vWvqyfV/NCThEcn86z3uh/mg3X1fShWgwjiIBnksQJcZiQplKpkcj9vGX+
 fLUHJG88mpKFA2ldBdlX2R3xImJ+hevdZndxCVUFHlCjfJGpGOY8PXkyzXy4GYXsWuiXkzhOHTT
 FDZpRdhTxVGJBS85rhYGX/DOorPTagVP/7SkjL714lBsnRzxJrIZrGssVRyJgd6+qviKpNfwr31
 3dckru+Uh0WVVw28b3XUHsz2feldO3qRZZOpn+0NY1wvgVzFMdh7WBXYQO/o0aMxmyOOnPRROkL
 CqQQR1OwVEvzX8UM8qQ==
X-Proofpoint-ORIG-GUID: ObreoVBRlDso3bkcBwSsDow8qwj0uJar
X-Authority-Analysis: v=2.4 cv=Nv7htcdJ c=1 sm=1 tr=0 ts=69ea5e5a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=EQhLecVpxEp8dAYONcgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_110059_249294_E66632F8 
X-CRM114-Status: UNSURE (   8.78  )
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


On Fri, 10 Apr 2026 12:43:00 +0530, Aaradhana Sahu wrote:
> ath12k_core_get_wsi_info() traverses the WSI (Wired Serial Interface)
> device graph starting from dev->of_node. The current code uses
> dev->of_node directly as the local traversal pointer and calls
> of_node_put() on error.
> 
> Since the driver does not own a reference to dev->of_node, dropping it
> during traversal results in the following OF refcount underflow:
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix OF node refcount imbalance in WSI graph traversal
      commit: f3ba9e05cc7b65f41f58bb4808f6c3a8f7894bb1

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


