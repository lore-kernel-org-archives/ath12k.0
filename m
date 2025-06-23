Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67BAC7EE39
	for <ath12k@archiver.kernel.org>; Mon, 23 Jun 2025 18:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smrlmfw7K0HprX+c2QJnRSvyFhrOeWmixWsgoCpa1Bg=; b=WYR36h4oBHo555aq0lJ3yn33Ix
	GXrWVC8NuIrifveqXZsFlSKq/TfRurpYf9LIH/t0UFun0+po+IWsEa4lwFuYMq5Ou3N2J9IFToC5T
	5HY46acZesmUXRQmDZrPKm1+i3B6PM91C6LI+lerS6LzRrTGEWPpLQBi/LrVm9dMnwQzura+cT9rc
	GqVgCOZ9I5BXq2x5Zi8Oi26oOWJHUnqIdGgFuo7cdt/FLv1r6rzCTn7ySnuI9oxYOdU+Mf6CNYiIG
	6I2nH8FscCrNgjjHKDX1BZN/3CA7ujP3maeAb1fCH134FRQK15JoVMQZfqYIShrTgVYmjqSsjts2s
	Jnv8PNng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlzh-00000003hEW-2Fml;
	Mon, 23 Jun 2025 18:34:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiTX-000000036xA-01kG
	for ath12k@lists.infradead.org;
	Mon, 23 Jun 2025 14:48:48 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N92fO9014947
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 14:48:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	smrlmfw7K0HprX+c2QJnRSvyFhrOeWmixWsgoCpa1Bg=; b=ftV3liiohGEg4EIe
	9LQrLfU3FIAFuaLDEg8RC93bMs2UlScy6QyZZ4/BE5ZohLJA+sCLPC8fUZkLxiVD
	my1cJWBY/MU1MShbO+Qg2GXNtsfdwPCcoz4MhU0vn74UY4OR4taD2qRTe8bZkn/G
	w7UbY3l+qVommVSkVilZFEvFQZ2goCYMpKDRrx9gYP5/OQqloi+7dOuBrIRHWxdu
	zIA/GhNJjA00jw6l9QN10viBCj/8Y1MNMixDLsp3uKlYfJX+PahV2aQCQAfeR9j9
	agAQvdRMXu9H59SCExGqAip0KMxwZXMM/WiX9p5mWv7FeRZvGgGI2dZG2e6TMMGj
	/8ahLQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3xu10jx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 14:48:46 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-74890390d17so3634284b3a.2
        for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 07:48:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690125; x=1751294925;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=smrlmfw7K0HprX+c2QJnRSvyFhrOeWmixWsgoCpa1Bg=;
        b=T0zm0j0/9U/VlCFKPASZPasToyr1Nk6ZRWXjdphPtCitCjbBu8x60rNQn/9kCu0SiG
         KL/cmipyvAX2Jr6RjSYs0ur860mniWBptMDlcbZhK6a2nZbxtifuwl/lzhvsT/z4gyxN
         vneMBgPHs+ydf5MXwuhkwOCY3BaZogCKrqLhiLJdhZznx+hpRuxyYjL+dUv8S09rkuDG
         byiILp9NfBh7Oq4qb9N7Tuyu4VGCTZCEJFxrLl0jsAtSZFr+9fKg7fAwA5qoYwIcjbcu
         1eQWIvMCYEg6NhWEdxSaZ3blDFjyYR1oHmQP4VvdJD6Tudobhwoyhk3vwp2SaOcwEzdl
         uBlA==
X-Forwarded-Encrypted: i=1; AJvYcCWIUllEXE9yQt4fJXdHUf/CLee72LuhnUn4RL1Svy6qbJwPx4C8N0MbPoNmCwenLtYaA5bxCIA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwVErkfHxUhuy3oMTxB2PxdMQJ85yLsCwew4KZ2aecVpCVqcNzs
	0HwJl+VVipvg5kScYRGQFsH+JnNTZgaA1eQnd2KskGWqEIrmOZksu4httfEijJjClnoTSpUXI9Y
	Q4ho8YDollssSYhAXM0YK6ApINxvN6hYAiCutchRlRALHn+WkULQb0B9wnmw00IEsVDc/xV4l
X-Gm-Gg: ASbGncsBJWVmmtTOjGAmu3eZ2lOJ0/rEu+euSG+YdGic2elTuO/2vkqGTqSCzeAAnzO
	ATZrUH2qRcDWmr/WMYjcY2wrugEVrzGjIxW5oX1bbozL25K6gYovJl43iSuwkx8QaFzxlX5Avvg
	GnnorbFDuBQViCETLVOoI7ln2mhuDBdLAPqKaJXQVaBc0Y9T0Ui1WjjEQTvkDP9JQYUTwewTb+s
	//sJpHMiz7AFzXEy+SVcltBKq8k3bvfyAdLUAseHbpvidkbDVQD5hFkCepTrvsFdhtlihz6GymK
	M90XbP/pLSvDz7Bf6o0XdJYhH2T3WpRSptNdn67hfIPqmM0TxDEp46F4xXk=
X-Received: by 2002:a05:6a00:a87:b0:736:8c0f:7758 with SMTP id d2e1a72fcca58-7490d7abc7bmr15085693b3a.10.1750690124695;
        Mon, 23 Jun 2025 07:48:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFI8H4aioeCCO3BadXRxVD5Z6GQweKGC54MAANid7328O86mBLGyJUYhNGAGHLFEk0y2GC6sQ==
X-Received: by 2002:a05:6a00:a87:b0:736:8c0f:7758 with SMTP id d2e1a72fcca58-7490d7abc7bmr15085665b3a.10.1750690124268;
        Mon, 23 Jun 2025 07:48:44 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6d1eccsm8332894b3a.180.2025.06.23.07.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:48:43 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250617-handle_user_regd_update_hints_during_insmod-v2-1-10a6a48efe81@oss.qualcomm.com>
References: <20250617-handle_user_regd_update_hints_during_insmod-v2-1-10a6a48efe81@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2] wifi: ath12k: handle regulatory hints
 during mac registration
Message-Id: <175069012350.3758471.8696092328804905972.b4-ty@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 07:48:43 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4OCBTYWx0ZWRfX6oQcFAZ6zPaO
 nwopQWvKrGolpOgsR6n9A7g0eBV13NrWnRhogGVCO01ULiRJWuq7CnHBv3VhViCWM/yaVsMepVB
 NDsHSIEEEmQo3dAnx06jwjt/RwTZ3xOFXPhcIKr4f/hiA3DGK2YiO2z8kP4eNy4VaDPlbyKJUq2
 7iTOWy4keCcSLix6PRLcBnr+dcSouCBHpFZiO3OAyXL4Ecgctej1sQwa+mjGpUtORPqySsp1Iup
 uoIMPjSs+Fdz7f16yzl36nTZLsbDS8bj2ZPG8HUMrK9g54XfWGi1A7VOtr/5rt/Vlh+gCgRvejr
 KjdLwvKaBtrESduWl55yLq2j7MLM9XJyBsT57m9Y1j+Rxh+BQ+xZUSUhSpi7BxCM2sFkodQznQB
 oSWCGMUWHEZWcMbPB19fhLzV9ffrKVLjohK0dj7HOzu4OLVp5axKKfjLTBq6ZfV2v1xjfrLr
X-Authority-Analysis: v=2.4 cv=SvuQ6OO0 c=1 sm=1 tr=0 ts=6859694e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=ZM6Ol1wdqZ8AtCD_V_4A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 7n7yrjKEqzYpgbhKX8ZApYTOIMmqLniX
X-Proofpoint-GUID: 7n7yrjKEqzYpgbhKX8ZApYTOIMmqLniX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 mlxlogscore=953 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_074847_163532_F49779DE 
X-CRM114-Status: GOOD (  10.29  )
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


On Tue, 17 Jun 2025 09:05:59 +0530, Aditya Kumar Singh wrote:
> If a regulatory notification is there in the system while the hardware is
> being registered, it attempts to set the new regulatory country. However,
> ath12k currently boots with a default country derived from the BDF. If this
> default country differs from the one provided in the notification, a race
> condition can occur while updating the regulatory information back to
> userspace. This potentially leads to driver having the incorrect regulatory
> applied.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: handle regulatory hints during mac registration
      commit: 906619a0096747adbce9415e10b639cfd2c5e714

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


