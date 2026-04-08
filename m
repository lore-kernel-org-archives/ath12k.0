Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40EE105D990
	for <ath12k@archiver.kernel.org>; Wed,  8 Apr 2026 00:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZTNOOdtudOY8XMCR7pZ8ZR6sfE8wSEZmRjAYzSYcJU=; b=FnjaaBsrFtp69kfR2tBgXYOI9i
	LMRu1Ki3Ccx/jdDbjpHBZD8Eaae/YqZ13OgZ9qyrpldMTtpNzNv3XDwHa7Z6YZgjETWodpSYPuMF1
	z7cAkLq8uIa0XMYk5TipOmnsslpakPONU60Oq03JOFqRFj8d+oRLYGZBI51FkDjgTQ+ICGNBHQkJN
	DOMaW23Y4uoKyA81AXb9TkPCQPZmriwkZW5tZQD3yZF+GjS31iyISCmMn1z3p7bsXf3kJQgj4xSCN
	sWtszhLUfV05CFJyuWrD8B3NORLSPloHCa5JHI9V3RBO9x8UH+/2879q3nho9yqg5BGbWk0AGfeDo
	4UxXxtww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAH7q-000000083QE-0ETs;
	Wed, 08 Apr 2026 00:50:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAH7n-000000083Op-1NBg
	for ath12k@lists.infradead.org;
	Wed, 08 Apr 2026 00:50:32 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637M6NuZ2450582
	for <ath12k@lists.infradead.org>; Wed, 8 Apr 2026 00:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vZTNOOdtudOY8XMCR7pZ8ZR6sfE8wSEZmRjAYzSYcJU=; b=Ozn7WthPBRVuJnAn
	R8cRKP/NfkUaYVvtFNTo1lVFDm3WaMeomXH8IzMMPeCCXVqvTILnC54DqscGLayq
	1mgp2AeSRjSl7p9Icr9j6ldT04UQ0r3+te3LVnZyynLEw85H8VmvVwpXm6yjj81E
	g3vqrIJ9LpWooIcgpuIHQCHYxUA3rzKw0dyhQ8uurSBmBi4xiPmaIIKIrebhFuIp
	zZj+LTxzvbm9CR6+IRZSxrby/CoLXcCemdy47Q/Ogeu8aI+OaqWlh0qqf2MNThjy
	wG9chVW2HraYFmntj1cV09+/XZlPFtM/pwRbC0A7+3PzUVRqsBfbNul9iBCHpL9G
	xLkN/Q==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddae68bqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 08 Apr 2026 00:50:30 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12776bebeb3so22665045c88.1
        for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 17:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775609429; x=1776214229; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZTNOOdtudOY8XMCR7pZ8ZR6sfE8wSEZmRjAYzSYcJU=;
        b=OgEQfjxYbCYfWirzBzAIuU7z4XtMjCWpNA3PxRSp5bVSUgor6X0s7954CIW3X4ES92
         Zvx2M1SmbQIickECyZ9mD13RCbWphLdYqpcI78qHmsBsx4we8Z4YKlT8GQl74gDxkKuR
         CxZSMyp0qlnIx6kLojUk4Wu6DH3rxmWZJr5ZEAlqxdncm62Im9JXlTKr3Vr9HKYapL/T
         q9knE+YQ5Nj89JrVeXPnE4W6aKM3kouR4BiKf7TNxKFBjErkzlHmumhmrj1UAATYLka4
         ke+hzz0UcKz8aN9RptMmNC/HmkerQzlV1L5Nl33Zl6HqZlJd5ole7rkO1lBGE7ODYn36
         jBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775609429; x=1776214229;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vZTNOOdtudOY8XMCR7pZ8ZR6sfE8wSEZmRjAYzSYcJU=;
        b=KMPIg8wjCnj/Nxl/K6dZ0wXRVTw+RCnoBykhftNFQq/VURFir4egS+z50TIBU0/Bma
         o2whBr0Xbb65nQo6tOdzfAXy1cAErbzcDlI88wNSPWhnf+SaYiwY2EZ1aCGXte4ISnQ+
         YToCLXteJtwxvX47SiVUIlglIPQTTUi2s5cv/b8VfVozjLCLnwju4EkeyVXN5zXYAWDW
         oGbAnl98BNV9eYoAz5DAfvL1eQjGFUeHwZuUn6bkga5x7jYoLNhATeqcdrezlJeYMIKO
         CYhV2D/i7LMqNdB8zyFxyyuHTBYH2K8D60iO2tk/aLxq7aBVjbSD0LxOBvG5ALKo6rc/
         4NYg==
X-Gm-Message-State: AOJu0Yyamevss/C8wWx+1QyAf5Yd219lR6HKl6SsvthsK/Ai0ALErSqg
	eq5w3xnsQvnfrPt1gD5QalABspUwJWJrywjCClvceif3KJE/Ox17Zry26PAbwNeKEanQhIM8BNl
	7b16jc86sNBAOmEhBMeLYmREn6ahm6NTc+DGjSxSe99QdCsjYrQYQwM/iRg03Pkj+
X-Gm-Gg: AeBDietFaSRF/dSahMK9DjvbHeNNWuG/fjHfavn6ILkWg3MHehMWAjBXU56tN6J23tj
	5VB7D+aJMADRFw9cRFMiDRG25x2OoNOtbYWT5Ic5M1Dcoenypxzgnv6kWx5DlCYbXmLFfCSuqB8
	CddCBdhAPXEvVLiZIxaiuvDo5cDEfr+rSPwsJcZZsBFJ1uGw2ByRhnbcns7vWJJkrOkCOyfw2zr
	iPC4PTdy2Kj/8LPl+/50OF4BePyJrwBllfVKI3LvxP3Ru27z2vRwnvvTHZiZBqpN59ZbfQxnkFf
	7E7+DER8KSC8jtg2gVGXpDBo5SLnv1SeXuoOThHrFA/jIigJSmZWoDZSvycb2Bpm+nDzVhyGBof
	73bfc59In6sLtPdKBxOmo5P6NW4j23qqT+MS1wdufOZsgoVhi3LlH6tjynkvvn/PD2T1R8yL1Mh
	6q
X-Received: by 2002:a05:7022:4396:b0:128:d2a5:709c with SMTP id a92af1059eb24-12bfb76f887mr9822354c88.33.1775609429096;
        Tue, 07 Apr 2026 17:50:29 -0700 (PDT)
X-Received: by 2002:a05:7022:4396:b0:128:d2a5:709c with SMTP id a92af1059eb24-12bfb76f887mr9822319c88.33.1775609428543;
        Tue, 07 Apr 2026 17:50:28 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d2d5409fd1sm1257301eec.13.2026.04.07.17.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 17:50:27 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
        Harshitha Prem <harshitha.prem@oss.qualcomm.com>
In-Reply-To: <20260402051402.3903795-1-roopni.devanathan@oss.qualcomm.com>
References: <20260402051402.3903795-1-roopni.devanathan@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Create symlink for each radio
 in a wiphy
Message-Id: <177560942713.2878209.5525143192959928768.b4-ty@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 17:50:27 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDAwMyBTYWx0ZWRfX12iHmP1Tuo8v
 3A0SBg3Yrk3aPKltD+Jnn7Bic2F7HfGE8o5kx34lb04PUeJ4VMZbkMyx8wYAu/0orByjrEDI7OH
 3pcGsaRw3drSZ80UkBIVal312GakkMC64gDU8FHKVG6R+mXHWLdzKdwatW2ZPz4Tm44Xmf8158p
 Ecq1blY34loil1zyljvOttU1ddIKinso31khuDvaZ9XDVFso7G5mUwLRLAtsDlYIBTA0EpxZqNI
 vrOsh26IbERI8Syhj0DGqCAvcT6hDkA3tityv5aranyr0G8peDQbH/BL+lXv0b1ydPAzXAhLoGv
 EhLU4m5SusXstcS/znI2JytJHVgci5UDecxDiuHmKuI6/s4CL2JuSCuUAEQcKkSVqlb/vYArtrk
 OiULQQV+2OTceqW704TfAhhmLqLGojDRfUfCsRoYyPiCwYG0gSygMG8+pMINS6ELJy7rme9e4I1
 agfdwMYK3aGrmtkgAyA==
X-Proofpoint-GUID: mLNNWL8xJuNMgDN3nGgKBDigoT_tAkn2
X-Proofpoint-ORIG-GUID: mLNNWL8xJuNMgDN3nGgKBDigoT_tAkn2
X-Authority-Analysis: v=2.4 cv=K4AS2SWI c=1 sm=1 tr=0 ts=69d5a656 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=mDO2wJrryWFW5kN2vdwA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_05,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_175031_485870_CA4ECEC0 
X-CRM114-Status: UNSURE (   7.93  )
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


On Thu, 02 Apr 2026 10:44:02 +0530, Roopni Devanathan wrote:
> In single-wiphy design, when more than one radio is registered as a
> single-wiphy in the mac80211 layer, the following warnings are seen:
> 
> 1. debugfs: File 'ath12k' in directory 'phy0' already present!
> 2. debugfs: File 'simulate_fw_crash' in directory 'pci-0000:57:00.0' already present!
>    debugfs: File 'device_dp_stats' in directory 'pci-01777777777777777777777:57:00.0' already present!
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Create symlink for each radio in a wiphy
      commit: 0ec4b904be72f78ba6ce6bb9a8aaf2eb6b9b1004

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


