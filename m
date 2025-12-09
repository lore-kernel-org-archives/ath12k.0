Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4467D3B98C
	for <ath12k@archiver.kernel.org>; Tue,  9 Dec 2025 18:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWc1his47YbW3kd2ndwPyUWBoedhRm0CEUI1/xd9weI=; b=qiBPufhGhRviRq2dvZuWhS8VhU
	YS0byPceoY7g3RC8ZFjekhdS3eCEvvAlVAC/vdauFacIp5YowyPhYxtrtWDtUmBEbAew4RW2eXPYR
	2qkkTPKyN0IOVe7mdb9EFI791XRkXiERDCMay5n5uWRKsD0qLN7gROz09AePJL49C23xxTTMHdjDW
	GKrUWG5ALhpEij6mcL9/8mTRN5s55uHXPDY8lrnCiNx54L+DO99VGJfwwjrMRrNOXcXePOMvi1fA4
	EEQLwFZO98TsNM5iJmnoahdric7sWCprociNywiTbN7+cQ2R3rIleDUMjV+qF3dXqF2Nq5McK4WVF
	WQmysnLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT2QZ-0000000EejJ-2lPC;
	Tue, 09 Dec 2025 18:27:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT2QX-0000000Eeip-0S0Z
	for ath12k@lists.infradead.org;
	Tue, 09 Dec 2025 18:27:10 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9GiTrZ3970537
	for <ath12k@lists.infradead.org>; Tue, 9 Dec 2025 18:27:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KWc1his47YbW3kd2ndwPyUWBoedhRm0CEUI1/xd9weI=; b=mLP/kuodHpApMqSc
	G87EVSmBZU6+wIftWzbx0snykUQ8uN+vhV3ojZMaIFkaBPsewbXsUJSx6suuYE9m
	yWRNjR0vSAqP93DTDoDwHCRk0kcUEF+I+1yvpyN71xui/zJ5jVj1/z1X3wkNDSpn
	LZ9UB59MuUl2VW9kIINS6tc+LN4edSZmzGrY+lvm67O5ddf034zDNXjrWpNw0LQz
	7qjiygkoZRHIu4u+rkyY3MKUHM7SEPIlQafOWnEv52nz0F6yc9Hspqo+sUyfESOL
	lfoQDmh3Jm86LHdP+xwLRzlRILOniAzmmosDJpiirE57UiWmhXd5oQYTHLg0WQLX
	fe/Lpg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axgqr9tu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 09 Dec 2025 18:27:07 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-bddf9ce4931so10339648a12.0
        for <ath12k@lists.infradead.org>; Tue, 09 Dec 2025 10:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765304827; x=1765909627; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWc1his47YbW3kd2ndwPyUWBoedhRm0CEUI1/xd9weI=;
        b=KipSjeXfh0+TkF5jxOsFPmVNvc8GV+iJG6LEbo0MkV7gEhVQPpXtNQFOuoOm37Gu8i
         tnj66vwth0QAoLOoC2KW7i1UFCJuGq85PhzazJqmZTglVoqatgzTXJJAhDqEFPeTWB+u
         lhWDEZBDP6ypZwbp106S85p7cqkgk3nvbURBZD1O1zAbo0R9UvbDN+JNBUMW+fQkMZPe
         kf35MoZzJrJXpNq9EBidLKNboMcxGXbvUiV7BUbiSSuYvqmTo6Jtt2lKF8G4BDKGAv+x
         lYjiDrZvBJIkQvwZZ5W8vavBQrIEZOz16vYxzkiwoj+Aj8Gb11ksD0A17384EtFQuPrY
         Wymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765304827; x=1765909627;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KWc1his47YbW3kd2ndwPyUWBoedhRm0CEUI1/xd9weI=;
        b=TVHZxlfgq6NQ6xHH6eU6TrjaTRWAKMep9MW1RZ+gozQ8uEAJVg2fe9UnjhIw4a9eIs
         9fYVuUpLAIdhSNQVk4T9izhzlmJVS2cBDLHABmn9ZSSHDKRpQ9VXVj5yuZDqETfjwkLi
         2doBK1oT6FewV71HfeNQQhBLVsgeVvAIfK3DUJbDVebEPRxkaOaZc6uHQJ+wVssVnCyz
         sG5g96vr5k26PXlR01kmbLRInItYyXuKtv00AZjdWbiHtRV6Ajeft/gXYNLInW02Gfrp
         332hYD0FL7CIXMhTxTzdaI9RYI+3dUfHSzVrvA4xxJ8EX1oIF5JBZHrrWC/0QSNhibLM
         YBWA==
X-Gm-Message-State: AOJu0YxM41TD5+M0KpFqfEh6RA4ykwpcgmPCNYD3Br94oIZc+SYCnKzp
	kEXFEcR1Jvipzn9mNFwLQ3wu8YuwyW9tmSfgj04ZGrCn18svNTsrTklKAO2JyKKfnKaM5YFi/1V
	3xvJYPHGAw7XdQQ/a2FmeKsjp4/n94DJiReogCUFfJ/i5/y9oVYtPURI4EMvHdGSezuDM9Tso
X-Gm-Gg: AY/fxX7m4PK5NfF1JIsBGJ6FEmPNv9cMQSGDzCxO/Pyt7iRe1ycnDOHqU+wHAFKmitw
	rgo39MnN6968L9vPA4eOF22kewz++PYsl1YNW351dO38OApcDDQLjVL/YSUmlw0MBo/i4sZ3Nhn
	aWidokqq58FGmYuGybguwXWtEGP81xMowIi4sFajFCSDXW3SZL6lJ2uhBOWtFSl2sPI/7OuGVuB
	Y9JFgwBF4cciOFw26G1vkRD+fZ53a/2yID5e15FS/9Q32Uc3Q1Z9GBeFdAlA72QKiYlNyFe/AIb
	Fu3c03+OyMF+TWNq+/Fq1okp5XCibb9AzC3J80ERvEtaX04U3RjLQEw9/phkxPd3F5oCqUG4cS/
	+SFvHHOF2tBQfmqj5urbvn4d44j+4E9AbLQXEj/emHsOu4Q==
X-Received: by 2002:a05:7300:f40c:b0:2ac:358:bad9 with SMTP id 5a478bee46e88-2ac0358ca8emr232424eec.34.1765304826605;
        Tue, 09 Dec 2025 10:27:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHb/yPodXYo7Re4324W/yvxqRI6/vTepPoy7QBffY/3pV6kx28oYV9En+0Z21x7gstYSKWg7Q==
X-Received: by 2002:a05:7300:f40c:b0:2ac:358:bad9 with SMTP id 5a478bee46e88-2ac0358ca8emr232406eec.34.1765304826010;
        Tue, 09 Dec 2025 10:27:06 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba822b615sm44650977eec.0.2025.12.09.10.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 10:27:05 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Ripan Deuri <quic_rdeuri@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20251207072717.95542-1-quic_rdeuri@quicinc.com>
References: <20251207072717.95542-1-quic_rdeuri@quicinc.com>
Subject: Re: [PATCH ath12k-ng] wifi: ath12k: Skip DP peer creation for scan
 vdev
Message-Id: <176530482553.1967172.17240990564355668386.b4-ty@oss.qualcomm.com>
Date: Tue, 09 Dec 2025 10:27:05 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: JDSWofyETJ-rsHo9cuBkhJt3_oQZEaQB
X-Authority-Analysis: v=2.4 cv=UrBu9uwB c=1 sm=1 tr=0 ts=693869fb cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=2nbRYCtD-rQ1MBVNGtwA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: JDSWofyETJ-rsHo9cuBkhJt3_oQZEaQB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDEzOSBTYWx0ZWRfX4NapsgWJHfRD
 nkcYx64+oECDCg6q3Up3oCGCH71ou4G8so0DFZTFjE+7gucyULTxYwx/wrGv99U5qRVyTW9FziX
 Rl0HWoW0cqjUCW/PCb90iBWacO/Y0KgGd4H+1CGl03NWvz3PJ8C0oZu7y1faHj2VmkMRcP6tLzU
 IBYD9HGZltDKfPzK34f23kTBUgnwv/2K7kLD73LAInxNjnn0q9lo8LbRJBRm3Fm+znJ2voy61tG
 FYb23SuPAyP654hJJzteZFprW48EF6y3T7mjQ321Q0Kznf6Ufy0n9c7wM9Wj4mbY/0HCN47FrE2
 xjvpPeFBg/39Zj5m7C898RhEfnyxfPA49pE0NXM4rF/IgLt0Jjkas0QnRNYo5mpUpWpzMrnGuKh
 ryQFygHJ3MgI1vcOrxVgTGavbHI2/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512090139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_102709_301344_D97B8948 
X-CRM114-Status: GOOD (  10.23  )
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


On Sun, 07 Dec 2025 12:57:17 +0530, Ripan Deuri wrote:
> Consider a multi-link AP configuration:
> 
>     MLD vif (MAC addr: aa:bb)
>         |-- 2.4 GHz link (BSSID: aa:bb)
>         |-- 5 GHz link   (BSSID: cc:dd)
> 
> For AP vdevs, ath12k creates a DP peer using the arvif's BSSID and stores
> it in dp_hw->dp_peers_list. During scan operations, the driver assigns an
> arvif to the scan vdev and uses the vif's MAC address as its BSSID. In
> the above scenario, the scan vdev MAC address (aa:bb) matches the BSSID
> of the 2.4 GHz AP link, causing a duplicate entry in dp_hw->dp_peers_list
> and leading to scan vdev creation failure.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Skip DP peer creation for scan vdev
      commit: 5a58414fe107e4844e0b5b33e94d8f3e563cd38e

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


