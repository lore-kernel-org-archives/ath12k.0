Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02253CCF9F0
	for <ath12k@archiver.kernel.org>; Thu, 30 Oct 2025 21:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qgdp88bQm2XOYf7cW5ZnuzXShT26CEZ9bDAzv5J2Y50=; b=dGZEQlxBdkFhnx/7IGNr0/bH8S
	3LZRA6wOFbTEcR3v83GAtaFsWrOUpFCxQKMC6yatXAcclA3YEElaX+kYNkHHoz/qcb7ibjOYDnjSF
	i9OqUQegbqQGSuclQFaocAk6uq/WJsCyS/kxf4tZKe1BsJE+FbRe6xL0L14d/cncwrYMf3/wNdJPt
	UsFDKYBQp3+qz8uugokXTezjdrprkX1bWXxuq3vQUajhbV8lSEc2z0vnkGW69T7MCbZ11d3foKmRS
	WgmPrKWiftBcgYhB+BnJyh5BpyQnZfXdK3FvoJCRSIblpIJVKYjNguBrj8bZqvdqM2MuT+JwRvesC
	Jj9+n8qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEaeY-00000004zsL-2swY;
	Thu, 30 Oct 2025 21:57:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEaeV-00000004zpp-2dgy
	for ath12k@bombadil.infradead.org;
	Thu, 30 Oct 2025 21:57:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Qgdp88bQm2XOYf7cW5ZnuzXShT26CEZ9bDAzv5J2Y50=; b=RpNBZYZ7T2FIGVa7IO/W1IAYcc
	1htan0g9iSQ+bB5vxduw9ykzqkCqCxQnc/M82JLPjd5JoORTqNCuORQruqkUadrkPtcvIUPiHw7KI
	i9ayVovFWN5pV7w8kdVhQcdo10dCWDVWoKbzi1UA+exNsF+AuTSEoipesyvR8JOoqsTx+C53+2cx2
	AqoOO4c3XbTCsD/u+J84Jz2sDhDxnCdpvCXRIWka4l+AwvRWa0Ef3F6gJ2T1PXIYFNZdQ3UwanlfH
	qVnzD28BMqrRE5IJzKugw+cW7nLd9zskfFkwVeR99YwMPrOyY1Yn77FCfzblR1x11wDYwU9R7c6QZ
	V2MeLmtw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZmi-0000000A5Jc-1bAv
	for ath12k@lists.infradead.org;
	Thu, 30 Oct 2025 21:02:19 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UKsPKP832799
	for <ath12k@lists.infradead.org>; Thu, 30 Oct 2025 21:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qgdp88bQm2XOYf7cW5ZnuzXShT26CEZ9bDAzv5J2Y50=; b=Rai5WUjsc/9uAJQH
	ZiwWWYiR3pr8L6Ob/rf/wuFjc7mTI5G/NRw83BfjUblgP7MZELvOyEleOcdScftC
	0arFX+FTebf5cNGdNbdUckjUUXGOFFzdhLHAItqVme6dJvB9fTz2cpElFKSaGX2p
	83VJo2ZxlQ2qgmjTkxEe4RIGLbctE1UPCcL9B3xPUiesMoT0WvPb9niPimeV/Ohu
	XgxZi3iBFkrIRkS8+SlGAyMvH6jbk5GAxSlAd8H42FdFSQI8PTJkd7UIQzvLZ/ix
	lHiLmTlwD0iP4ZBO9ioOYJxFIb6mKIpIx8bSuTQl77uD3jR6nwyVrQlz7ed4nXjP
	A474zw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ffb04ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Oct 2025 21:57:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-277f0ea6ee6so14081955ad.0
        for <ath12k@lists.infradead.org>; Thu, 30 Oct 2025 14:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761861463; x=1762466263; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qgdp88bQm2XOYf7cW5ZnuzXShT26CEZ9bDAzv5J2Y50=;
        b=YT3C4Uls8LdlSHg67U9SID5lqJkjX3o/z4ujWMPaDLc6WCXeaqyoTDhHeAli7p1SQK
         BLIRt0hv9wvrFjXv6v1TbcsLb1VKOAz6bHCiBuummVSZPvE8W3Rq+luTK4ZhHgftO6Xf
         XHVlcRnyRhce8laugdBE3WJrQYnEKi/kt+Jp8pT7EGcckDcym6jH2VaeN5q2o1vnNzE8
         P3luXTEZTckAmReXH830kCXzZhHCZPDxX/fl0fyjG5ZsxznFYOH3p1T6k+KZ+xtmhk6U
         s6db4zDixUoGd2zQjPWA5cT1k4Da7t5VHtyylNhZquO9HjuHOtpEcx2RYlNjPEvVMGF5
         QBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761861463; x=1762466263;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qgdp88bQm2XOYf7cW5ZnuzXShT26CEZ9bDAzv5J2Y50=;
        b=Y+mC6zZk6pt+rm0z9iOLgFgLr3/2UNEraQ7l1shfN776y9bWQS1Tm/pdONxryPhXwy
         0UA7CwrLl6ygnoJnp1V5fZRNryi7lTniyiu47nPjGFP3shbsmjZi1hpPFfwovR62Hfd8
         r/hn31aS5EC5N6MJlOPtRqHlHAZkdfzog5BVNWcPEqHqQ/Dg9ceuhNO+idmxtv6Ao9B4
         w1nOPedBEhRgWarIjttrqP04e+aJUDVW8dpQ1wQTdOAKD0HkEcMwdExqI6JVz/uzhH/W
         8z5U/jFnAYHfABpNMSvUmCQIJFI+MHJ3IItAXuYvtOyzX7BCz0vRuWzl8Ss8+/G42DqU
         ySBw==
X-Gm-Message-State: AOJu0Yx/I07ob923+9kg1LRME4kVxbWC8qrxea9ThUbEQqJCj+iy3OzP
	+8Ps+KMt81MlH5SWCL9bQ1GejR9ZXrtHXfpCOHzgdrqDGPSO91hpOFWnYMN+cDoQ3eAp6q6XhVv
	8pdYM7OytdMMdEkPDm8AJa5nZnDbaCKotkt8sHU1GygFTn83cGLwLQJRJ11DJmquLOvkE/x8t
X-Gm-Gg: ASbGnctQ7yTP+Q32BU0+QToonTI96L/Ma09+EJDRxlU1yib6gLEV5p0mMe3wU+6LVLK
	+O9tsU2N1bHbWpuQxFo/o1NXlR5vIUtA5jD/vxq8fAag+IhP/+qEU/Y/FiP+FmtHwKm200Osh20
	79O7cjVDCdCRjOf74p7v7iwtcOWOQGBju6SdZcgza2qNr2hEYcBMIQqxr04sg3nRSWG3hwDFmiA
	bYuq3RuzgOIAVfYvAOSu/UGsndy3US+Ba7K7/4TeKehdCtYm4URFNtNGzZlX4coyLEqekZqWGxG
	jNncZYA6scHMd6QEpUNGgZsO+wc5F0LdHDkfLKtc9R46NzXg6QLrkLZBbcy6Mqnu6z1PI6ndPiV
	xX3vb++dkiMrNSVpb1wmYw5fNH11xk7d+JOM=
X-Received: by 2002:a17:903:1b4f:b0:28e:ccd7:dd61 with SMTP id d9443c01a7336-2951a600dbcmr14998695ad.57.1761861462939;
        Thu, 30 Oct 2025 14:57:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOzoOlAs5uiroESWYyCEyPUV+hEl7UXhaWrI12e2vdeHK3ip+JF/C5aO8Gz/eG2xfF9d8sJg==
X-Received: by 2002:a17:903:1b4f:b0:28e:ccd7:dd61 with SMTP id d9443c01a7336-2951a600dbcmr14998455ad.57.1761861462469;
        Thu, 30 Oct 2025 14:57:42 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf4a53sm201868405ad.6.2025.10.30.14.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 14:57:42 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Muna Sinada <muna.sinada@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20251024001928.257356-1-muna.sinada@oss.qualcomm.com>
References: <20251024001928.257356-1-muna.sinada@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/6] wifi: ath12k: Add support for EHT fixed
 rate
Message-Id: <176186146187.3489476.1922723439873291173.b4-ty@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 14:57:41 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: lCNJ-ep626CcO8oRYrcqKNSzUCbniEIy
X-Authority-Analysis: v=2.4 cv=fpjRpV4f c=1 sm=1 tr=0 ts=6903df57 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=EF6NOILu3u18UkSBF9kA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: lCNJ-ep626CcO8oRYrcqKNSzUCbniEIy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE4NiBTYWx0ZWRfX3arhonrsp8Zn
 XXknnFEhgFZvg1aHMbKGvbc+ZXjncbc80B+H01kPXeyntle9qUkjU0hnrSiJJeZ6cRO/kRsP9ej
 vTA37mKRw+3gTH1b/FbSyHzcJq326vykSxWavnAKKjBc6pHACMdwnN1CX5zT+RDmujraM7PdwWb
 9icuruPZPklKuazB+eNWx02CmSnhpyVu/PokBZ69ECnXYqLGrkrBPSR7i4vFsk9aIyZnBD/u3wz
 LwTPAiCcmAGlWI8XcthUvL3cgr1eLXtykMRb45KJqeUhEYtwQVWAxYLiX/FVxuuDsiUa3x/MdAD
 2P93D+VWO3GkAki0PviXVzo9No+RyuZfnEuX19kRYQiZs72EUasi2u7E67MHfUqAZ7jju3j9RTS
 avjdumL6r71l15zHY3FiSqagHuA/yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_07,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_210216_925886_F69CC270 
X-CRM114-Status: UNSURE (   8.05  )
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


On Thu, 23 Oct 2025 17:19:22 -0700, Muna Sinada wrote:
> Add support for setting EHT fixed rate for mcs, nss, GI and LTF.
> 
> Before adding EHT fixed rate support, generalize GI and LTF setting
> functions to allow additional modes besides HE to utilize the
> functions.
> 

Applied, thanks!

[1/6] wifi: ath12k: generalize GI and LTF fixed rate functions
      commit: 770bff79424beec2edb8e7cc63b0e8d1b1a927a3
[2/6] wifi: ath12k: add EHT rate handling to existing set rate functions
      commit: ec1d9b79be5df30f1998f37a49bf14d34ecd6c50
[3/6] wifi: ath12k: Add EHT MCS/NSS rates to Peer Assoc
      commit: 6c95151e2e776462de6b6fd9e577865e8b32203e
[4/6] wifi: ath12k: Add EHT fixed GI/LTF
      commit: ab31a9b73c95ca8a1b527a0d9fd9192a27acb26f
[5/6] wifi: ath12k: add EHT rates to ath12k_mac_op_set_bitrate_mask()
      commit: 5ee9cb2c236b45c4d58d6d464a12d985e453576b
[6/6] wifi: ath12k: Set EHT fixed rates for associated STAs
      commit: 09486128caef9efd88794c8aaa1e9ab16b16f383

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


