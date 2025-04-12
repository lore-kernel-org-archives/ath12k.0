Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE903C369AE
	for <ath12k@archiver.kernel.org>; Sat, 12 Apr 2025 04:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y6c+VvP2BLTiwbJsNHMC/15PFH6qteRzoX5JMy9RgRs=; b=cs4sfqw2m24GrXVxaagiXb8RBH
	2GJb5zAIWbGP/5b7MaASsXRkvbNqvapZPdPwUEBXqvp3VI1TLZAnMXzM1xQ6MFksbdvJxR9Ijn7+C
	PaJC1T2bAYVPH+gbldRR4xxwSS6+NZB/tW59SaZpRiSxufJfZm1ELOujlbuDxX0Fdv5mginEwYgCK
	XGg7etDCmqgvoqlhQYug+CRrO8ixjdF8H64cx16Ug8wS4/QkI0flD+/8cSG6DHcOYenDVEk6n2DPE
	k8yDA28j+m5QvKHQQNt217xMBmevJdFpt8zpE569F3u75wguYcYY8TeMEdQ9KpbQPG8OB7VaejvVD
	gxtnqZKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3SPh-0000000FPP3-2RAI
	for ath12k@archiver.kernel.org;
	Sat, 12 Apr 2025 04:24:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3SPf-0000000FPMp-2esa
	for ath12k@lists.infradead.org;
	Sat, 12 Apr 2025 04:24:16 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53C3jbZO018309
	for <ath12k@lists.infradead.org>; Sat, 12 Apr 2025 04:24:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y6c+VvP2BLTiwbJsNHMC/15PFH6qteRzoX5JMy9RgRs=; b=MgCxZjSMPZWyGEUa
	iQZhwJx3i736vBATTTWnSetpe9NCFPZy5N7N7onaSof1Ixe8ejb0mRuJrXj5D3Z0
	G/24FoC0sjMTpiz5/1mA6Q3ie5HSzbiwoD+kliJpL4FzcPK2fy1V880pFbUhVl0v
	dfO/SCQ/xh5+9JFMFHGMo9T5kb0XsTb2wo5ojo4EN9SSXWHnK0Gs4H5747NjLV4t
	hrwzfr/yphVU4XCdf1+Vrdw/SaO76jl0+P76Oy1nG6z9hFsTinILbpMJ0mraSShu
	6AimK4zuUtxPTm4NNmk8vPdFPVCatPUqKFaPZI25J14cYvNgQFKq7ST/2qQ/PxYV
	D3/XkQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd681u7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 12 Apr 2025 04:24:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-30364fc706fso2245958a91.3
        for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 21:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744431854; x=1745036654;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6c+VvP2BLTiwbJsNHMC/15PFH6qteRzoX5JMy9RgRs=;
        b=UGO4JDBro62+umajMAXCBAyZ1sHpC32jhw1seNzjKvQOnAUDLgkTjC9LPGWcxv2V7J
         nj2cIOS62sokjYxWoJZ/B01BBR4MhvURi3jdsvJmg6omKTdeNeh5xpBr5idx6uiUe62E
         eCSocLCthB/1OBbgfFuSmriIVT3LOaulIT1fL8dda3/t8Pw9D1a637mtWp5LxMvX06dS
         IsAJRBjmhJZt/CkIlBC/UzzC8bUCIEv1OipPcdOkCIfLSka5YUWWgLXUhV7B5rSqCfcI
         yGa1VV05qIwqDExqccQtd2l0SrYXp12BjIf597n6nFbWG9imlDHvJNwBRZG80iVaxYPE
         Wztw==
X-Forwarded-Encrypted: i=1; AJvYcCVmtnL7et88NnNzUF8gmd1k25ubCezxVk8eLwa6Ju++bRbgDlM5LqTlcP7w3PC3Oy+/CcQMs+g=@lists.infradead.org
X-Gm-Message-State: AOJu0YwNqYQM7Z7kp1s5tnQfMSPX1z3UK96Ar5Z2Iwj3enUdV7hWlRbN
	YRVpl0stjCae/xOuSsFjGs9KcwoT72OaFXjAqiyX0Ahxfa8WOf0uNkhhbeOXBNuYzswDsLNG+em
	UzTGeCVkMm9+HXd9bFh1vZw1mZmJLs96Kaef0mbN4hEJz6CxMb6h+snCBRCMw
X-Gm-Gg: ASbGncvYHgfETsJBuk4nCT1tolF3evgjK4mfkYWHsbx071owbkJpo4X4QBSYmA8br4B
	kcu6ar16EdM4gnuHCZrb/dZpaMQKT4OSZZ0O85BvUvauF3S2AegyaRoPbfPsLCbKsI2exUC96ka
	UYx03W2KJKuzdK8CjFu3Sb4HNt7dJ+EytC/kxHEABETonpHbdxXg12/bPjXNJ5zP7gyeffbl5tU
	njT65FYHjdFEtA+40+7OhKEOMjIdJcAVmZ9rKYwIKR04BPLeOr/Ja5HrQ/80qliAGwWRUtHqxOW
	PmYIaNU9qoynlqmu5GicxcvHuHpTsPiFPx0mao+OLzg/eA0r
X-Received: by 2002:a17:90b:2752:b0:2ff:5e4e:861 with SMTP id 98e67ed59e1d1-308237b52c1mr7682569a91.24.1744431854208;
        Fri, 11 Apr 2025 21:24:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3bEjufM8uvzXi2R+XKSYAounBYRf966QbZ07aJvDs1jVqVY+2eE0x4NE/tknOoj+yN8R4Qw==
X-Received: by 2002:a17:90b:2752:b0:2ff:5e4e:861 with SMTP id 98e67ed59e1d1-308237b52c1mr7682536a91.24.1744431853719;
        Fri, 11 Apr 2025 21:24:13 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd11e643sm6829912a91.12.2025.04.11.21.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 21:24:13 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Balamurugan S <quic_bselvara@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
In-Reply-To: <937abc74-9648-4c05-a2c3-8db408b3ed9e@stanley.mountain>
References: <937abc74-9648-4c05-a2c3-8db408b3ed9e@stanley.mountain>
Subject: Re: [PATCH next] wifi: ath12k: Fix a couple NULL vs IS_ERR() bugs
Message-Id: <174443185268.2972989.9053090958982417610.b4-ty@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 21:24:12 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: XFkO4roEZWyi_sKgeVfK8ko2RoOPUzP1
X-Proofpoint-GUID: XFkO4roEZWyi_sKgeVfK8ko2RoOPUzP1
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67f9eaef cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=0MIO4mkLTHUyxov_fOkA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-12_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=781 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504120029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_212415_686000_2928B95B 
X-CRM114-Status: UNSURE (   7.06  )
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


On Thu, 10 Apr 2025 19:26:16 +0300, Dan Carpenter wrote:
> The devm_memremap() function returns error pointers on error and the
> ioremap() function returns NULL on error.  The error checking here got
> those flipped around.
> 
> 

Applied, thanks!

[1/1] wifi: ath12k: Fix a couple NULL vs IS_ERR() bugs
      commit: 4703416d0fb993f7505025667f868f6981a5f7ab

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


