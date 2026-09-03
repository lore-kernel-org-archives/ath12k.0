Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBB9C624DE
	for <ath12k@archiver.kernel.org>; Thu,  3 Sep 2026 19:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7EOv+0PGb/XVZAZxUChw+QL4ytEK6KA1P5lSVlbjJ+Q=; b=AfwlVbFD2rsYoxgOzSoDabLSx8
	uI01l0Kuz07P1QwFpNRRKsHBHGRY32frJcWKDYld/FsjQBcKe5jhXDsho8Ukvt98R1DVF2fAa+OW7
	eLI/4OustsYcgw+DG9yNeXgH8+QwTs9MAp6wh+zTqf9INN+fC5vKC7oIJg8165WsNmGVDIMAaFA8F
	ZhJFSDWQhauoKjYPT6RgMnNf5d6hLS+N0VMtGkpkKd/q2/ciRVpk0oBSklUMn2fcl59+OvkACFhTZ
	UC0XsWOtOcULbdUWECZZfq5nfnzMH0IDAzoQykKvTfHp+0rroanaM3mhCq69Z04WKSuuHf7vCAzch
	iPza3djg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Ci1-00000000QLl-3rm5;
	Thu, 03 Sep 2026 19:02:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Chz-00000000QJJ-0uhA
	for ath12k@lists.infradead.org;
	Thu, 03 Sep 2026 19:02:48 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3eYP1209691
	for <ath12k@lists.infradead.org>; Thu, 3 Sep 2026 19:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7EOv+0PGb/XVZAZxUChw+QL4ytEK6KA1P5lSVlbjJ+Q=; b=ngi+57Sk9rZbiLm4
	6tJsg+HbU/IQmhsYrOtfEDLs0LSTtuiqspJwQR9KGlJO79zCSYcpxFitLJXUWeIQ
	xIBAffKCXN/dx4o0xPZ02iNOwrTt4hruiVKBo97Lcf/EB5pFoTjOAKV1tVTbkKFI
	X95qLPCd/yV+tURzc1oTYovmJ1zSF5lxSLH21v0oqO6d3I3uSaYX1SsnTjVY5MCw
	zYr8rafK9tZvFXVUNsfFi3qm0hvVPVpsVScpEnAVGCBguQFRPirXqrGJx3U6pWPG
	qDPM/ERaGceRro+vBWce+DZ6HUjqkpAGJm0dn8uh5rI8k1yuqUTkbwiJld0ct3M7
	FopHTA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf6p72fbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 03 Sep 2026 19:02:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso333679a12.1
        for <ath12k@lists.infradead.org>; Thu, 03 Sep 2026 12:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788462165; x=1789066965; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7EOv+0PGb/XVZAZxUChw+QL4ytEK6KA1P5lSVlbjJ+Q=;
        b=d8PWfTrpLbst0WNG0azOfwaZHNOo4bdfxQ+xY/qlbAVFoQeNbxINup0TLbgp0t6Ei9
         7qf2iG5AbAbyCufaMg/bQqeVWY7t6CSUsUdROCHeS8W3Dkr3MZaK97eBk6Qu8uJm48ci
         ymKdCsKOFoxucitAp7XN/8pw7XNyzUS0XOw0NAITkoQTf9kqW4rSU9gkKH0fcFGJl2cD
         TYZz1iZKHoMNxc9v7nmOpl4J1AOuUru0qYcy89VWSNO2Jt/r7Za9D+q1ViAr0FS1C1d5
         nDBu4VIES0Dh7FAsFRLrmUYp3RfqqtRTQ+rqZBsdrPBXGXQ6VbbEnpJR1LN7ZxOKp/KO
         78rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788462165; x=1789066965;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7EOv+0PGb/XVZAZxUChw+QL4ytEK6KA1P5lSVlbjJ+Q=;
        b=FlJHODGMPP1ZqxHmSwjutZUX9xpRCoTDZChqCVvK3KEjn8xlBoTQwySQrSgA+7K2Ki
         g6Nmof8OzdM2yXIyn9rRa0tLHZaY7yybUtOMBSiKoDUhFP9UiHWZuzOzhCAYaD1iAiS2
         SR0GBc5J3JHRjPzTb74nv+DcJ85jHlQsC1nZjwNzBsNagi8qxjiPTTaKfwqQMm0qk3mK
         tHZIgsu+ZfnzHdXJ+R5xy25Lk8yfRN8/aJP5qqxr3wKK2GeHhP/4QgS3fLXUJ6LIWFxn
         FFUw3NbkruifD41j+uCSrYtPEqP9yQMziWF53KwHkd8fp2ZwJpGHewoxtUYS2+SpwauE
         m2tQ==
X-Gm-Message-State: AFuF++lOH6+3qGoidXYpSGsNuGOQMkbSKIQOhFO/l2z4mJ4qGhMdb8pp
	9RkcojWCtSr9lKGguCRbaedVwRfwW+f/M9ZinA3Qt3gNHd1apdEaoSCRJDH2cHCFST3fvV2Nr6C
	PCRMINO3rQ7Ply8cQLTXpNJDavg5ztpq4Gjpwd4OCHtocsnM2+lntIx2/D8Z/IzGz9voOx8r8
X-Gm-Gg: AYBFou0ppO8Skom+WD+2Dq/F6iXy7oxk6IVrFYUb3mAWqK5VHhBgHkEsgOu5wt1r30P
	CevBp5YZfrj5Jay4/Rg0yMA0FTpCf27iw6gRhsnKoCyJZXMOHd9f0kKekqMqouLOnOlOKKKwbzb
	FrtDNKu7ljiWjL7kCnboU4AubiR0rSwxxqIt+vU6djR8VvsoNxINISTEnorwnTgmNsO1Cl1rgj9
	Iy+ImQE3cPW7lxDTlV/gtTkb7DzxR3Pp0knRFsR+sFHdrH78hC/Do6fdEgbPC76QWB0Re7EJXhf
	+M4LG2vIJ5+e9FqyZScdxAosCBrZvctYqZG/qI0Xr8PDsPdaFNduSncZa5CZmuVoWMyzFwJGvxt
	WPa4+aaaZRatQNv2OJ1TDz+/zQs9xGHvg5VIpXhIb74/A6EMH7B132sQ=
X-Received: by 2002:a17:90b:1d52:b0:37f:eafd:3505 with SMTP id 98e67ed59e1d1-39b2612eb8amr834699a91.6.1788462165061;
        Thu, 03 Sep 2026 12:02:45 -0700 (PDT)
X-Received: by 2002:a17:90b:1d52:b0:37f:eafd:3505 with SMTP id 98e67ed59e1d1-39b2612eb8amr834592a91.6.1788462164403;
        Thu, 03 Sep 2026 12:02:44 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm1230164c88.11.2026.09.03.12.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 12:02:42 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Sriram R <sriram.ramachandran@oss.qualcomm.com>
In-Reply-To: <20260810070109.700301-1-sriram.ramachandran@oss.qualcomm.com>
References: <20260810070109.700301-1-sriram.ramachandran@oss.qualcomm.com>
Subject: Re: [PATCH] .mailmap: add entries for Sriram R
Message-Id: <178846216231.824911.7300341548702361786.b4-ty@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 12:02:42 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 0TQcpXjhvWNBBJf46_sy6Me4bmMFkc82
X-Proofpoint-ORIG-GUID: 0TQcpXjhvWNBBJf46_sy6Me4bmMFkc82
X-Authority-Analysis: v=2.4 cv=OZyoyBTY c=1 sm=1 tr=0 ts=6a99c456 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=JYcE1z2nLrce8NzV_A0A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfXyMadjeCA2SFt
 kbXgL60EapjWrEsnAZ5lfX8jwsuxeaIWUtHpSyOhuKuchga4JfixRQpo6vCdzpGA5XFrtsUIsWK
 QVS/fkkl7QF4XDUU+lwc0oAMimfZ84Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfX6+jxQQZL6Mox
 ymqHYw1OF3NI8JFaaskXN0Jriv40RbnwC0t79Bb9vVu917R+fronjTl/yjdMvzIcyA7b8KhghN8
 Vns8iDeBiTnWpARt8zzgVdmNO3AdoR7/11TV6nqYx2xvXdALnkN89sucCbrkISoBDjEEF06Yp57
 etyF0gIqI9RYMWUsO/yKH4NdRwzgeliz4YNV9mWZ1hWHIerWrCnDP1/7Vh/MPA0LYCRFUYiuDq8
 FawQ4XMVwEpWcAdDYIkg5EU0DIY49ni1MhI4N1e3eOUHvPfYb4RU2zyXe6BlHKYTQvlu4UAVrvK
 ePSNqBKno9xYBaJkRHuc641qZvnJo90vv/YCv1XhSClvkCrRI71aEOE9EpoDg4y6CeP/FLop21Z
 A39CCwP0Hdo2QaN5Bf8P/EjYgM8v5eGrLzDpa57FzC7ThR2Rz2Fis0mKapVNohb32TxCfTsk49k
 nidtpYAYuPpUkduUb7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_120247_405403_B3820399 
X-CRM114-Status: UNSURE (   7.88  )
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


On Mon, 10 Aug 2026 12:31:09 +0530, Sriram R wrote:
> Map past iterations of my e-mail addresses to the current one.
> 
> 

Applied, thanks!

[1/1] .mailmap: add entries for Sriram R
      commit: ede121c2c2c0894e161d2134fb6c5598ab72085e

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


