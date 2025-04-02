Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD959C28B20
	for <ath12k@archiver.kernel.org>; Wed,  2 Apr 2025 15:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YWPVDzyugxAflJFq6iLaRlE5P4ZqPyHBftmbgYjzF1Y=; b=UBQiMwXdRk+MTUPMUZXTw13a3c
	gLLCKf8OZYE5snFyaM456xgFA2aUxrdjIC+5Y5GDxL/Y6MhSZIzjmvqgvdZ2j4qKk6JDwUAp2nMfh
	V6Tiq5BOwjgzzSQwxwXNvN4j77aSDT2iUN+YrdFSzQtN7+h2lScTZrbt62bY9LKTyXNCOyMN5pmTH
	jSIBuqLYbT9L0rgFLMwAOZMSy1V/4lY/MUNV0i8ZelVnhYzFBwc7fIgO63RCpIYp2heKkSwUYDoa9
	v7rktZHIrwudz+bU74wlgurGzSIQoQqj40zpcmTLUc3WR5+vdXT750bsvpmGIXLLm/FWGMm/J9pb3
	kazOx2GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzhH-00000006T4D-2Hul
	for ath12k@archiver.kernel.org;
	Wed, 02 Apr 2025 15:08:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzhE-00000006T2Q-2hh8
	for ath12k@lists.infradead.org;
	Wed, 02 Apr 2025 15:08:06 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532AB3jH024325
	for <ath12k@lists.infradead.org>; Wed, 2 Apr 2025 15:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YWPVDzyugxAflJFq6iLaRlE5P4ZqPyHBftmbgYjzF1Y=; b=SBP4rg9fVk39J3GK
	2elGBbQ2SlKwclJIe6Gr8oaFm51y6EerSfsUSDilIYTK6PsFMTNZiBc2A2i8KZi2
	AgKsIc4vVPVknmeu15K3+GSSrd1YNxVtUdkoYw+5ieMgyq/tsxPqgFon7ElD+ezg
	GiHGstuYT9uSfAaBv6i3/VhVjdH57Qw0DLyts6vMhWTXrizy6ZbTQtGebgBxOhbz
	CPZgYitZnV7kTYvSHFqyC292z6oXBISf2T2BO3nNQIPHIofwdun2Ws8g4siPkz5b
	plHTXrTKr0cCE8nYoix+WtW3E4AixVNwfAXQ8KHFDYRYojLun5M42GB9L30n8ynn
	2CbGOg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45recpm68j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 15:08:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22406ee0243so96287375ad.3
        for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 08:08:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743606482; x=1744211282;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YWPVDzyugxAflJFq6iLaRlE5P4ZqPyHBftmbgYjzF1Y=;
        b=eUN7vNmC2/+as+HMeywx8mt98BRfa8ZvnBXNKTygx0OX78uSfwAa/gfpOrwVds+W3Z
         dhaheiLUuv6vOckNziMtqWcZGdiuT0wyWQ3zjRd1vfa9Bn2wQnK4H+bA+fNc8F+7OuAO
         PAtsGt09kAkam1+YRKSQe9WBmyIGnMqDoE3NJTkHe4undF5jf0uEwc5FewoSjGrWDL6x
         WQ22ITvoE0W/TRsoSXVtKVKViuZcJ3LJ9SVbK9iPN8Mla+77RaDaxoT002kvWWwCYGcP
         uhijHijLScJ8uaSgrbHwT0QB5F9a4qpzKqmzTmtWBAAn9oZXXKW3n3cyiVF6mnhk3IHh
         6qmQ==
X-Gm-Message-State: AOJu0Yz1/fraFmAM1beertG4NFis/lCSQs9bLS6K6+WggRIioED5VWsM
	gEQnTwL2ia8Q1LWDXAgElWYJ3Sn3XmlySDVJsgDPo6mJ081Cm1imIS1y59b7Tr81C/+VHA9YQBZ
	QAVVRbtfXd1WcNru2G+qEhUUu49s8HoSDxc8Tna/CnOqzzSqWLrsSyO136oYd
X-Gm-Gg: ASbGncsueI/tOubazhGzDz2MBha44Q7hOlzE9MiWKKOwwDVMUtkpzHUPNnpy5xwgbUS
	S8dkUjgVojSFGR/luWYdWnX/NaEGfBCDcU1nFJzQr88qyq769OgdnH8Q2j1ddJsfSKc61k+qYVt
	gYXcDiLueeR0eJWSIF3IeaopXb8+L19rUgVZNflujlh4QR2ZavfgZ+zUPDl6JdaVGVfOeLblYCl
	j4Lm1QMOoipJQUGYSMe428EgcnRCwMzhMIVnf/Jck2Je61C8Hs1bC8RLfjrXD/73J9uLPUoyb0A
	juKvrqmvAuLPujqIstfh6aGKnxqQ/OMGEL9eGDvzh5s6/i0di4KT
X-Received: by 2002:a17:903:19c7:b0:223:6657:5008 with SMTP id d9443c01a7336-2292f974807mr295523165ad.24.1743606482503;
        Wed, 02 Apr 2025 08:08:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxFI31BLjo9H5AnSdfC5UM/tcdMze1BMgiFXDZGN9nIfKlejkbi+zgdZDO1htp+sovQitGNA==
X-Received: by 2002:a17:903:19c7:b0:223:6657:5008 with SMTP id d9443c01a7336-2292f974807mr295522335ad.24.1743606481672;
        Wed, 02 Apr 2025 08:08:01 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eedc988sm110193905ad.59.2025.04.02.08.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:08:01 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Muna Sinada <muna.sinada@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
        Sidhanta Sahu <sidhanta.sahu@oss.qualcomm.com>
In-Reply-To: <20250326213538.2214194-1-muna.sinada@oss.qualcomm.com>
References: <20250326213538.2214194-1-muna.sinada@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix memory leak due to multiple
 rx_stats allocation
Message-Id: <174360648091.2001642.3728671779418142424.b4-ty@oss.qualcomm.com>
Date: Wed, 02 Apr 2025 08:08:00 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: 8fzVyLQaMXi-KXExy9eny2euUsGnzGea
X-Proofpoint-ORIG-GUID: 8fzVyLQaMXi-KXExy9eny2euUsGnzGea
X-Authority-Analysis: v=2.4 cv=J4Sq7BnS c=1 sm=1 tr=0 ts=67ed52d3 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=X9lr2ljuSIhPkOebW48A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_06,2025-04-02_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 bulkscore=0 mlxlogscore=787 malwarescore=0 mlxscore=0
 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_080804_690992_11DC37CB 
X-CRM114-Status: UNSURE (   9.50  )
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


On Wed, 26 Mar 2025 14:35:38 -0700, Muna Sinada wrote:
> rx_stats for each arsta is allocated when adding a station.
> arsta->rx_stats will be freed when a station is removed.
> 
> Redundant allocations are occurring when the same station is added
> multiple times. This causes ath12k_mac_station_add() to be called
> multiple times, and rx_stats is allocated each time. As a result there
> is memory leaks.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix memory leak due to multiple rx_stats allocation
      commit: c426497fa2055c8005196922e7d29c41d7e0948a

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


