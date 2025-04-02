Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7556AC3601A
	for <ath12k@archiver.kernel.org>; Wed,  2 Apr 2025 15:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GWHIyxo5rvVvPxb93MLiHYfWejVEeyBRIf1dWoTt+Y=; b=mtoAVeLEi7NaJ58XsFOe20eXgv
	HVGQbFmjD4x2CeNhmQfj6IG+T3JwLuEINKdNQJ0CO81+ieksaGYKOtOMdHaJCPdRcq6WJYxOd59gg
	NmfrzvQemIy+HfWclHEXn0RhcmMXqmOYUCGwFdLOg9ArebTPUPYKn3h04/0DPUAU5n2qLOmdSzWI6
	ghFMMh2c2UIn/ukDx/D9fTRZzWpORQ+u2ZEVs3ULJv8W133UZWNwEZV3/reLbcUjdhLaEss13FhrR
	pbKthCI5CB+Oepe1BU5swIbIXuWexsDrJWJ29SCCqEbGBfK7cyJ8YuwzJh/QKi3CvRTcIGGwQzhrn
	7uajSseA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u00Bt-00000006XmC-0uUX
	for ath12k@archiver.kernel.org;
	Wed, 02 Apr 2025 15:39:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u00AN-00000006Xaw-07nk
	for ath12k@lists.infradead.org;
	Wed, 02 Apr 2025 15:38:12 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532DEIGJ011796
	for <ath12k@lists.infradead.org>; Wed, 2 Apr 2025 15:38:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/GWHIyxo5rvVvPxb93MLiHYfWejVEeyBRIf1dWoTt+Y=; b=i83CMuOWLZOz4gpZ
	okxsCdBTxfKpUOONqhz5utjg7n7Ab5R4t9qEZULejo1xrTc15ZeLVF+VFm4KDZ0D
	xROOWHu5v3LJvApypJQWF8NgOUTKJ/No0zk+w0kux4xiv0zg388BuEYrRI+Rb//h
	7HTxLv5Hri9ZIO9Y2GSAn/2Rr2u+/D4RI/m0gfxXGQjyCIVpO4jRzGsAuZHqpUjV
	72fi6kvIKBpnQCTjfhztf/w97pyqTRL28qkdvp6QXOiIiam3e4IZan6KsczPX5EW
	I55UO/LDka0ACYFOSrTqA8wtK1hNF387OoCQGGNVgDUDccgG5SDX0ZSUb94NxxB6
	IrMzKg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rxbf1tk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 15:38:10 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff854a2541so11200786a91.0
        for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 08:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743608289; x=1744213089;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/GWHIyxo5rvVvPxb93MLiHYfWejVEeyBRIf1dWoTt+Y=;
        b=J8xdbxUVDxgSm8NmwCHmK2uuDj9emauHrLNtQXObtrghUzTxWbzGGwsdR8mJAuG0q1
         IzHkAbeY7Sl2Oqwtgo3KDLE3ibEyEECPCbxzimK8gQcu01JoUGygYYxmvOufP1F01GCv
         opMd0/4XxNFn3sjEsxXUyxP30LrSMosn5hmfHOVZm5OlaYhKcEGsbA24h6F0zwLEcmzx
         wdRvvXzWbtr+yVe/mUUjhAIcIdSnq3scibq4ypaap/NRAbpoaT9z9s9JYAcYsSwT9jwB
         tKfAX2s6xPDd2GbpaRPDSQXLLH1rUVB2IB53CX9cWneptv0JS/N77rZMxVbeqPhswwP+
         OqQw==
X-Forwarded-Encrypted: i=1; AJvYcCXAl4giOd+xGupaPvliSXb95Rd4PZhDrue1bQOvswfAIxc7kx3dIE6lHSei2JPemMOByBWTgzM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy0Db1UiOjdJWgLN/MsXKvl3F4ctb1a7n5IrbVOF4c3drV10O3
	dd/NO0joJ12gWha/2HPjD4CVvnYU2cqJZNbki093B1y2Vmttr3adXgwOYLD0ZO09Hmehg/rePb7
	y4lcvNW3QPKmJaL687clCYl5im8XtMwIFFhVuo8co3kVO3gxXCsACkmlZIAg2
X-Gm-Gg: ASbGncstVk3N8T3OM7vOhDujhCFENbNXX6xSD75symRxO8SK+ZzpOzwP1CDdraVaJeu
	5Q1ITlsFFrSRYx+DoSQR+GsI3AFrIAwDPZYJ1OCmmJVkxi2HAoZKz6ObET4Zj0HebKAEkbyptSH
	xhMPvk8qxfh3lr/CIfEEFmoM0wjGtQVzr7mSDhegeWPMR9bfVBNyRgcgB0IoKGdwyv978Iyq4j8
	2H04rooGcfSom1PBbCXU+BdSGCNQ5GehZtw0P8rSwe3lmwXYc5TSrkPbUPr2Kaj0xGdn/8+yg0t
	zktIC81gyzC79bTfonZelSDJFEeVo5AdDAXXvq4IcZYGApcWh5uzUtV8kynUP6Q=
X-Received: by 2002:a17:90a:c2cb:b0:2ff:6fc3:79c4 with SMTP id 98e67ed59e1d1-3053215d1aemr24637969a91.27.1743608288637;
        Wed, 02 Apr 2025 08:38:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQMz0BHktFpeCbS9P7BV/d6ICFDH5ZXqLD6hZ4mBJE2QnJmdeBfMkIGHS5ZODAe7dL7rJvAQ==
X-Received: by 2002:a17:90a:c2cb:b0:2ff:6fc3:79c4 with SMTP id 98e67ed59e1d1-3053215d1aemr24637944a91.27.1743608288258;
        Wed, 02 Apr 2025 08:38:08 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.201.59])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3056f8a81f0sm1759461a91.37.2025.04.02.08.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 08:38:08 -0700 (PDT)
Message-ID: <70c4576d-7b11-7992-01e4-1f32d6e31a56@oss.qualcomm.com>
Date: Wed, 2 Apr 2025 21:08:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v4 3/3] wifi: ath12k: Enable REO queue lookup
 table feature on QCN9274
Content-Language: en-US
To: Nithyanantham Paramasivam <quic_nithp@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250402152529.1649402-1-quic_nithp@quicinc.com>
 <20250402152529.1649402-4-quic_nithp@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250402152529.1649402-4-quic_nithp@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xWNbQBv8krNN_Ubmz0rURKmWmQ_tN8cl
X-Proofpoint-ORIG-GUID: xWNbQBv8krNN_Ubmz0rURKmWmQ_tN8cl
X-Authority-Analysis: v=2.4 cv=F/5XdrhN c=1 sm=1 tr=0 ts=67ed59e2 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=HMRESTvIlCqp6qiEfvMpsg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=BhWuI7cmRP5ft_gkYV4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_06,2025-04-02_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=807 phishscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_083811_221905_E2C7D19F 
X-CRM114-Status: UNSURE (   7.76  )
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



On 4/2/2025 8:55 PM, Nithyanantham Paramasivam wrote:
> Enable the REO queue lookup table feature for QCN9274 by setting the
> reoq_lut_support flag.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Nithyanantham Paramasivam <quic_nithp@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

