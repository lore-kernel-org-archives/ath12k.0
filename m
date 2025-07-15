Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C6EC83F17
	for <ath12k@archiver.kernel.org>; Tue, 15 Jul 2025 19:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n83EQ6KplxBdN8niFuzxAF76NZhTqT2FpXssYODZebc=; b=SrzPGoEqWkqU4r2mRpv3ZZVlSJ
	q/88KRQ/eir4dzBPlM2Kki2YCbPYibkiS10sZuHUW9neNre6SiUKhb8H0SDKvBRmhQCNUv5adPV3h
	RU+KqazE678YKCbLCK4rP+h1/7JV0kUK1s8qI6i5fKBafCawrcuc5zYRzH94RGjLfxwNPV3FMsaoQ
	zsqCzWnfOr83l1U0uCiRmqfU3dJBsABZT/c0YcQHiW9IuzAQgrRgwVdhKB4LjYfAm2l/GxdACueN0
	8+saQWyuGr0k4LeybQTKpCCS9SQ4k2m0tMxx5cdni9DZD9hMtaRRl+e7Q172RDkYFTqk8lO0/f/rG
	nBuryEBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublBU-000000061ST-2zxW;
	Tue, 15 Jul 2025 19:19:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubiRr-00000005jtw-42YO
	for ath12k@lists.infradead.org;
	Tue, 15 Jul 2025 16:24:09 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FGDgW3025524
	for <ath12k@lists.infradead.org>; Tue, 15 Jul 2025 16:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n83EQ6KplxBdN8niFuzxAF76NZhTqT2FpXssYODZebc=; b=Ajk7F4MsTpPv28NI
	EKNfV3u7ji1pukri8imGRTnpfTrtxHCNfRt8D4ZXwnbfstmWj1nlaIHB2EHBhKYd
	sTZFdAnwl0Q2C1Ed5SEUbFTz4UXoGjoTHJw1Wp4M6DTzL6fmsOrNnK1iMmt4qio1
	Pc/2LacsFH6ComtRsrJgkaSqiSwl5jU5GYEmlJbFIZJI7zSFOXMO/JcuE4YQsgAp
	geK+orQ6D2bXm1uegFJAut9GA0PXQEuhGtfGoXjl3J9kBVShE+5jPaCC9ljyenGO
	DVX5JWnFp+4vY1OuwmDkIT1OO6Lvh5IOuOjGK9IHg/azeF6Yz8qc5GOC/epfNHz4
	dbOssQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpbu45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 15 Jul 2025 16:24:07 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b34abbcdcf3so4215462a12.1
        for <ath12k@lists.infradead.org>; Tue, 15 Jul 2025 09:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752596647; x=1753201447;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n83EQ6KplxBdN8niFuzxAF76NZhTqT2FpXssYODZebc=;
        b=wMxfMBP688f53gLnLrTX25N0Tt7ZNns+WPZH6VP550nGCrOIPoU2Z6Zsy4i+JLrPpd
         +78+s9o3iyVI6DK2wZFlyH7VrTU4iiutt3MyGvBh+7WsWHpFKgRwQuysxEXr1ZsoyieQ
         NRZjqllAwDZi6vZWI2ni786IM+r5AOhP+uKWRukYrGuHSmGEJ0buh1p2yERCDw/7tn+L
         y4FtNesd4GCmsDj7OYo7DnsKksvHYMRqreEDEEss4wtXig0hC+Swjs/NAk5ypXjy8TYF
         CaEkHYfC0rJPoYUa1lZcsLt5oOSrNXDIyO5gA6fcktlJAZ+ci7HRJIH2+ieSBPMRzrKN
         txVQ==
X-Gm-Message-State: AOJu0Yy243aM2GwfsHIM2ori8WGqqrZfdpjfVlEO5ahdzASXxiwouhBG
	chWszWermFfV2Z2YgzUO79QOVmcJBUOwNVMssaC2hEKTUHAbM0m8Vwbo4yPE9EfNbQS2Ouc3IA4
	AJHQflk9aC28BkHwswXnbLrbAxv+ZlyOQsWlLIdg5l4yNUv8pPFS4teBRuieqxx5S
X-Gm-Gg: ASbGnctNlIz06sa1m78r5vbDUkSHbFvNif3Kk1kHUVzbOHmjnxjCPaUgSOw2br8N1IA
	qarFBg8b0oGolgeCZCJc80HW7kCC9NoOQa4Easx5oh586WdeB4G0FQScO8o7tdcl3wd6tcL/PLY
	LxMOhNPqpnpYDANvBGx42QOlcGcMSyglnx5Gl8wdSGrbovcs8EUgSHTM3xaI3B22XoQ7g1E2tqJ
	3qRVLO+jhecVQQ2+PYkeaDdTtWKGgOuhQLNboLB93xwW7cRdgZZgPMk/0DJN62TB011FKFfrrde
	KAK6nyRaOSVbunkvZMvQDAZ1KL4/mu8f7Z5hWfw1jY5s3IYIE+i+rX33npHhMpT4G72y3TBIpnn
	m
X-Received: by 2002:a05:6a21:329b:b0:237:c17f:9813 with SMTP id adf61e73a8af0-237c17f98ffmr383770637.28.1752596646666;
        Tue, 15 Jul 2025 09:24:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9yxvqSV+l3b7v266rmFhGhvhLcbbc/QTVLpv+MDVZbF7ryPH1BRcAqtw3C6RkWgrW/KDJrQ==
X-Received: by 2002:a05:6a21:329b:b0:237:c17f:9813 with SMTP id adf61e73a8af0-237c17f98ffmr383741637.28.1752596646210;
        Tue, 15 Jul 2025 09:24:06 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f1b715sm12815373b3a.93.2025.07.15.09.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 09:24:05 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Nagarajan Maran <nagarajan.maran@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, Sriram R <quic_srirrama@quicinc.com>
In-Reply-To: <20250714111438.1134438-1-nagarajan.maran@oss.qualcomm.com>
References: <20250714111438.1134438-1-nagarajan.maran@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Validate peer_id before
 searching for peer
Message-Id: <175259664470.3448282.10740985705944149227.b4-ty@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 09:24:04 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDE1MCBTYWx0ZWRfX31IoAV3fdfvt
 k8YBTkobKx8W8EegAtFpuFQ7tqtLXcZ5lLLIC2eV6cLzxYm4168+aT8pO61BVSh8N1aorEoIy31
 X1HvLs/RKt6jS/fjAlvyK7cqtyDn0TMAk7S2gu88bi3fy1FAbQX3JTv0EttbCsVZsEcBy7Fs1At
 b329Vf+Iv/WXYIuF9qHsjuYglXdmHC1YIy4TPhZC49wve66j6uq0WSmJ9KN9O75nwII+Q2KevTv
 Wk1rVfzMhKR6a5VY/16QEQZT7wLuQpESDBb99wMIkopCANGt5klKw2UEM1KWEkds4Uj0ldc7Zll
 Up4g88PDvbs7yUd/NUkSZ+3c+xDcrxd5zjVgZXYt0Ezch6+EnN4BEgtdhi3BdTcFqFaR2YCxJGi
 8+fdnJGXRCoKnxqkoFn70i+durgNHcomSzdyLLaJCOo/iLxzArNEXs81nwfq5oq4wchwTI6u
X-Proofpoint-GUID: vtPKgMlTfHK30csycc-Tb4pd6CjD6q87
X-Proofpoint-ORIG-GUID: vtPKgMlTfHK30csycc-Tb4pd6CjD6q87
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=687680a7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=o3kOZhjVV3aoIho8ZNQA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=659 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_092408_009521_B1A7F5FA 
X-CRM114-Status: UNSURE (   9.62  )
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


On Mon, 14 Jul 2025 16:44:38 +0530, Nagarajan Maran wrote:
> In RX WBM error path, error packet is received with invalid
> peer_id (0x3FFF) as there is no peer associated with that packet.
> However, this invalid peer_id coincides with the ML peer_id valid
> bit mask, causing an unnecessary search in the ML peer list.
> 
> Prevent searching the peer list for invalid peer_id and return NULL.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Validate peer_id before searching for peer
      commit: 136aad17e14250c815dcfc2e3cf9926e763b7436

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


