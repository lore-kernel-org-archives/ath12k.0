Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52A0C021A4
	for <ath12k@archiver.kernel.org>; Mon, 24 Feb 2025 16:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eynNTv2kSQLvrbRGLtm4NlRxri0pSZCgwjP4utbEpcQ=; b=yQTH9Vp9zfqlym3bc/RFygh62J
	+gkHupodFS/NGXyY/TD+BOEcEia6aH6w56FMRWeKgm9bxH0gUj/QeM4XZxmh9wcJ8d8+UgkEk/enJ
	kQ5K0Cx8WQXQYowyQiS3dXZhDbrWAF45LCnnsUVSR4fSrkRTz9PAAVAIt6Pr02pQs1Ol2gPUqbC53
	0ZrGoDpfW8ieA8t9pq1IyHpveXZ+TRxfzNk0cvNBZDlR3XlgQ4y8vQpk7ygQQrDW4D7u0s7LV8c78
	lIf3Eku7dR0i8vzAHRt/Kp288aBFJ13VKEazm9gsA5oqfuJEjBjvpvBx+e+fNXAUboE20hkLM1KDO
	QYCyxYWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmavy-0000000EOjx-2pvJ
	for ath12k@archiver.kernel.org;
	Mon, 24 Feb 2025 16:03:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmavw-0000000EOio-0NC3
	for ath12k@lists.infradead.org;
	Mon, 24 Feb 2025 16:03:53 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51O9OCaC008915
	for <ath12k@lists.infradead.org>; Mon, 24 Feb 2025 16:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eynNTv2kSQLvrbRGLtm4NlRxri0pSZCgwjP4utbEpcQ=; b=J63qAXq0KWbKm+mn
	wpkL0g89XPukY4Tiv/mitwM1Ks0FVBozSbS3SESNXhbNMt7R9VQUI3VIsuuKiDeH
	3H3+1VhANJ/V34hHmbsctEAVwC6eCAGBcsbe4QbJkY9uxt1W3LJdgzK46bXfgMnd
	ww/h6rwws2hxDzykx0TCy0T4+4Hs37wzmO+pLxkKXWXR6ZVs4O1Ljb2yep+ZBI66
	KQ4L4GkBWxnKHFcxwxvIB6wNMDoJ+f3QI0+bJpbryjSWQQpOtTTI58ZAmKHEJGyX
	n2/HqguXcXbHb/MCK4tMgCxaMvRnyiYlzeX3QqTvjIt9XGFwb3seha0VmsagUrxY
	KcM8cg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y49edx5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 24 Feb 2025 16:03:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2fc1cb0c2cbso14814942a91.1
        for <ath12k@lists.infradead.org>; Mon, 24 Feb 2025 08:03:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740413030; x=1741017830;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eynNTv2kSQLvrbRGLtm4NlRxri0pSZCgwjP4utbEpcQ=;
        b=ZbLvIFLbwNT+EBuG55/lGHbRVm5auHj4p7itsV2IANX+m2XFYfZu3fHIoG4B84W8mz
         nid3UJ2Oep3FBEt4FUmY81xdPhiW9dUUZ91nqE3Igw05ThwMCFoM3bC1+TQzLVonUOu0
         91fzF4RasoRoew9WOtzygteA1FmSp3B6QrmcjN2GFElMwKlPTpCDqYULsMVd18Au7s9b
         nZzsZluP7h6/jwOxE8bn10BZmlS55LDkXzzuDrWQl+lwq/fVE4ZordWm73weqIlA0/zH
         YBcQFjarDR8WqqWrxM0E0J0756f4xyWygXApQSgi77pCPvjfvOzA44qeOXL5jhcsYRvZ
         PNHw==
X-Gm-Message-State: AOJu0YyenP0yCpFX/Is/BvpfNgUWfsXLMYm+QH+gpnX8M1eJyzqBBsMu
	41ISUJhHsiRCcqCqpO7+edvN9L/JQf+v2CZy6dr0LmyyrJ3KnfEhYhbLYdrZXwY8LmsQucrK/G1
	80x1GODOMH3NmGmEAeb8i8OXhpnkKu9s2ZrGa7EVrGC9FBupbgmWJoUq80Xvy4BnzZOFM
X-Gm-Gg: ASbGncviGviFVGE32Tp7e3cUJCNogJhx8Yudn/ArSfvJiZroKnmHa1cC/cINxKow1Q/
	PvCMkLVUsqcz1NukHtad39X5k7gxs6OQmBQuGZKZK4Yy+RuNQls6LcTG8o1mWi/bX2CDynzCyR4
	edbw+gPSVvBJDtTEmt3DpVqE2eFNvl2j8G6KDsotym0CXrm6VpS+S5uLkcAhDfiVF7PslSr/x3J
	XbWJasJ7pPhPbVp5enrVCbCqsX0Z4ojeYkayLSXyJjRIWsnYuVpQLyD1SaTpSd9w8hsWrcBVwLQ
	Nh8m9DhXGIVnIXbVnVjhwRKR+UPaRHmzwmy0QlRi6SsG9cm0pb1j
X-Received: by 2002:a05:6a21:3949:b0:1ee:c7c8:cad with SMTP id adf61e73a8af0-1eef3dc67c0mr25988131637.28.1740413029801;
        Mon, 24 Feb 2025 08:03:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnsEg74MD5qB7ynWgwL7w0k0hcOFX75F1wbbBIKHXR2yGnkdSpsNpO5bmnxb0aQ2hTXZtqAA==
X-Received: by 2002:a05:6a21:3949:b0:1ee:c7c8:cad with SMTP id adf61e73a8af0-1eef3dc67c0mr25988088637.28.1740413029420;
        Mon, 24 Feb 2025 08:03:49 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7328371e36esm14470744b3a.61.2025.02.24.08.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 08:03:49 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Baochen Qiang <quic_bqiang@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20241209024146.3282-1-quic_bqiang@quicinc.com>
References: <20241209024146.3282-1-quic_bqiang@quicinc.com>
Subject: Re: [PATCH] wifi: ath12k: use link specific bss_conf as well in
 ath12k_mac_vif_cache_flush()
Message-Id: <174041302874.2901106.7386807697655031327.b4-ty@oss.qualcomm.com>
Date: Mon, 24 Feb 2025 08:03:48 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: LNvwR7NKweZwJUGu0M41yDn4C3MIrQeB
X-Proofpoint-GUID: LNvwR7NKweZwJUGu0M41yDn4C3MIrQeB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_08,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 mlxlogscore=729 lowpriorityscore=0 mlxscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502240112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_080352_161692_A4E9B8F4 
X-CRM114-Status: GOOD (  10.67  )
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


On Mon, 09 Dec 2024 10:41:46 +0800, Baochen Qiang wrote:
> Commit 3952657848c0 ("wifi: ath12k: Use mac80211 vif's link_conf instead of
> bss_conf") aims at, where applicable, replacing all usage of vif's bss_conf
> with link specific bss_conff, but missed one instance in
> ath12k_mac_vif_cache_flush(). This results in wrong configurations passed
> to ath12k_mac_bss_info_changed() when the link in question is not the default
> link.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: use link specific bss_conf as well in ath12k_mac_vif_cache_flush()
      commit: 11d963d44c77261d6a948f3745bbd678eef4b83b

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


