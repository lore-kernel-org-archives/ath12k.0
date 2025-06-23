Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62D1C7EE3A
	for <ath12k@archiver.kernel.org>; Mon, 23 Jun 2025 18:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3u2UsWwNOHw0K5RL0LIdI2bAlituELP+9ZWGZzNcnro=; b=ZPalBZbeO6lz2RuXKL/TrMxL9a
	gRexS14E1xLc1y7E9wXJZfFABlGdXN9NtRF5VuPBmt/QHto/sWFAENFXV4FOjyHL6p9Jm22o/QnnH
	sXv3gLswD5DNpzoZa+OWQjCdgeUUKjHBRwfnGo1oi7mp0W23ECH6qlODOZlVh8XYjww5+ETsRURiy
	ErB3qMogntAdr1jY9u9I+bUhYWrRDmZQbDSu4B8vSlwhPGLEumPGIQT/1j3DJh8KVUI6T+FvN1BXY
	Tj3XjACGRkyQfh3Lt9T7IAoDw2yZOe74e6JPj0JnOI1KTzWkjk/1lrVtNppcGn3aGeZGRj0NoM6Kb
	JUizuByg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlzi-00000003hFt-2qhm;
	Mon, 23 Jun 2025 18:34:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiTY-000000036xi-0EHX
	for ath12k@lists.infradead.org;
	Mon, 23 Jun 2025 14:48:49 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N7fRfC021627
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 14:48:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3u2UsWwNOHw0K5RL0LIdI2bAlituELP+9ZWGZzNcnro=; b=ZfMmGWn70YeX5kZo
	YW8ck/uV5F+/T0g4IIkgOSbw2cLr50iYze25lNfj2be2HIhmEisjdtDyeBF5f4fc
	vnTMIUVDbvWqxBNxHAfbGRl694bUfxqi9GHR8JOxFikKItWlahW7aG+PjaE5ICLC
	1UiT4ViOSaqshAsS98roIhwCJNmMDPEf1RTw645zRAuSGTyfhBv31a8j/VvkOHHL
	pz5pho84jTUrewYWomlMGxaiDw/YGOIiLmDFMFcY5LIFirMjVPT54FeWp8t6Rxrj
	Tqz5/t6PLVO5oXexDT3jS+9Isqkn0k8qr0bnXtN83uksw0E6YbndBIGnFgGnU0VH
	/Tk75g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rps6fm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 14:48:47 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7425efba1a3so4594152b3a.0
        for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 07:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690125; x=1751294925;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3u2UsWwNOHw0K5RL0LIdI2bAlituELP+9ZWGZzNcnro=;
        b=XJtAWZ31OVh70cRl7wPM+/5NQdwuA0FCTKw+REczwJd0LDt1bQ9lCtv2Rj3Gtl8jMG
         bRXOmWAN3Qq9N8diba5LUi8LC+8pecutAJxdgQng4fEG+yTdNkbhLMYZw9GI/cUI+oVS
         0UQFRG24+Vf1h2dp6H3u//2KNa+JbhHG9Isg4Zx6aHVvMImlE4qX99G9uMmbIg2e6ti1
         RmUDJXfkQ9E2NqkewTWIsrkpMltoXJni8NVL5lBIpiYBhONoR/Lhdfjg29vKKeYT0hWf
         VJWaw9xlJs4wRbX6SN97ujk4tnPrr2rZZyBQk4pqrKwVCCN6QcvSsNpns948TfkAURL8
         Kb+A==
X-Forwarded-Encrypted: i=1; AJvYcCW0daX9HHFwoFWLrbi80TTtiO1PERE8NAI1VE6ZXH/+NWs2o5XMuDEIRUoK/DN4xA+sP5ncGJU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyQi2HnS+0kOv8ox22cZpl/QiakkhNBOHUKqS8OeMfmxawIublp
	AumwZPoS6kQ+5fwtKjiBCQjNdWtHwYmcNByVXjNNPhsg7XVN5sH8VDKqADLxwA/GRk6uNeRdh54
	GwKVUL9GI2KWhHkMoEseXQMRY21Zq3HK7HmKInXZTFV3+cVFp/Hcn3Ihb03CzimGN
X-Gm-Gg: ASbGncuZjLuNtrSIvo3eJbqpxGqfderfL3oTXZZjgPxNhMBm1YkqW1gC1ekWmox/wiN
	wYcJX9Se1/zMY6pr8uqvP0rri70EdPgjdKtOL13mXISy9O5vObNSIhiGNePyo+SummLCzKoV/9j
	vegR09Sz2WKP66eD5LY0drabPABi0kZ996tomVbJTOrP0UBDe1CKb/fKCKKELS3731Uf8f4WyOP
	nemGcsCJXWrj2PdXvsPWWanSLEJ+7Y5c+svV8NCV0kvRcAVNurQBAb5m+FTzSNEKsiwli4fnbrP
	tmSeE83ZxwXUgiB1Ukq1f/3UMN9fZJMzcWdBkK+/mLxcjoQXJqTLAOXNROg=
X-Received: by 2002:a05:6a00:4146:b0:749:1e60:bdd with SMTP id d2e1a72fcca58-7491e600defmr13374392b3a.2.1750690125492;
        Mon, 23 Jun 2025 07:48:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQRVvYAXXguR4h45hA8mHP72d4LBWLqdt8dB/qCfMgFAV4oWSoJigOJ4Z9ErviJVTpXKp06Q==
X-Received: by 2002:a05:6a00:4146:b0:749:1e60:bdd with SMTP id d2e1a72fcca58-7491e600defmr13374358b3a.2.1750690125078;
        Mon, 23 Jun 2025 07:48:45 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6d1eccsm8332894b3a.180.2025.06.23.07.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:48:44 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250523-ath12k-unicast-key-first-v1-0-f53c3880e6d8@quicinc.com>
References: <20250523-ath12k-unicast-key-first-v1-0-f53c3880e6d8@quicinc.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: install pairwise key first
Message-Id: <175069012445.3758471.34015701209057251.b4-ty@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 07:48:44 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=6859694f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8
 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4OCBTYWx0ZWRfX0k4V7hU6U9Px
 gVtoAog1aboEEKrl+Gt2uYe6Yfe5WEkE2lrvo4om8kbjjLD/a6pIU0TvM/DAMLp+FJ6YHrd6Bk8
 TlydrrLi1vxGGylqTYWyHC3l9QJJN0/Jy0IzGWMSS+9AJxbKcPLAXqjTK1KOpJPo4bt7jn22qMs
 1eKNaIqsTZQnVZQaBufXko2fh8xns7WFaMjg9Mtj+uZb9epa2uQJUtMFFzRlV9U+lf6loUGtJVB
 3wRPAj7GTxpuFWGdIj7JBcgxNnmxgo2ND4mv0QH6u4Mto1gGu5aJ0HZru2iFPCpES/wjMPOBRmF
 yWWaJaNjSHRAdABPBfBxQXDK3uOIUqlayBGUPOdi7ucRisDp/Byrjcckl2gKhdpNLU01+E1GOsI
 4bzw+VJ8nsUB+3AnkJwERKygGAteauXI6ZowmCftRxofKoBlJGCDOl5NVmzx4KE3FwxW9O9L
X-Proofpoint-ORIG-GUID: HB9SExNdRr_wsap-vEgDI1CVrsQ8Vp2d
X-Proofpoint-GUID: HB9SExNdRr_wsap-vEgDI1CVrsQ8Vp2d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=948 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_074848_215046_A36390E1 
X-CRM114-Status: UNSURE (   8.32  )
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


On Fri, 23 May 2025 11:49:00 +0800, Baochen Qiang wrote:
> We got report that WCN7850 is not working with IWD [1][2]. Debug
> shows the reason is that IWD installs group key before pairwise
> key, which goes against WCN7850's firmware.
> 
> Reorder key install to workaround this.
> 
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=218733
> [2] https://lore.kernel.org/all/AS8P190MB12051DDBD84CD88E71C40AD7873F2@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: avoid bit operation on key flags
      commit: 49375e11819b0d0f59ba59726d8e0b47656f5406
[2/2] wifi: ath12k: install pairwise key first
      commit: 66e865f9dc78d00e6d1c8c6624cb0c9004e5aafb

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


