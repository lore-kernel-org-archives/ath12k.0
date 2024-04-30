Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45ECC4345F
	for <ath12k@archiver.kernel.org>; Tue, 30 Apr 2024 19:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CwttRdqjcJx1cGT3JSFgZLgJk0qdm1CgpZaFkSvuCTg=; b=fxkZxHQpNo1kylkisASOgXgcLn
	Y3sxTVWqWpIX7idvZSc8coK/OOR8xCk0sY9hsDpAhyJuRmMGk2JVBa8RXWBObOlz4Q8Lj28Hu5VRM
	JGAeLDOo4qszo8+cGPvLSHKtbbibIVHnGd9eR3g4kxQLrws9OYDw6yxLWF3fsM8gd0x3V3HmXQ3Qu
	gVfss3N8/nQ9PREDo9hCDKHpHgfWVql0zwLikXGh+Fq4r35TwWVwW20zSq0mYbEvXYvtDq6Pp4TuN
	yYJIrctuzrNLVZYM5ojrVs3m/35rbbVZaaDeU8Zi1z3mjgoRxXnBUuNQNq5G1xY+7U/1y3vsYCBwC
	DQNChOnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1tIk-00000007kAd-1XvH
	for ath12k@archiver.kernel.org;
	Tue, 30 Apr 2024 19:38:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1tIg-00000007kAJ-3Car
	for ath12k@lists.infradead.org;
	Tue, 30 Apr 2024 19:38:04 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43UGMdHT028460;
	Tue, 30 Apr 2024 19:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=CwttRdqjcJx1cGT3JSFgZLgJk0qdm1CgpZaFkSvuCTg=; b=XB
	xKa+3bjelfpqLFaiklQIgfyVmfrIKXl2jarOFAPPxiv2kjSsHpP460p86uT7z1fW
	eTRt8QpECKkonrfP/TAnd0hWhLAIFeFibkxg3DfIXYJrDHGugUGHNISHbVdjsRks
	HHZEGEbxN02DcJc5K/UT1Amit0DU2E5avkr2vy3pJ6r1tbOWYhKhhNnM5mt10WIe
	mc6hclBNa+THvvrH095+TTKqA+/lv4khE/z89V5iI2ydOUy3q/y0SPfaoJomeLGm
	FyBe2Tdqn69KOGMf2ZiUn0oQOd3PEVsarMEdhgkFEhElPXWeXHfdn+C6+1baL/DB
	wRiD16nGm8B2g0BI8ttA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xtsnmabgd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 19:38:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43UJc0MW009400
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 19:38:00 GMT
Received: from [10.110.13.147] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 30 Apr
 2024 12:37:59 -0700
Message-ID: <20086e83-4288-4ce4-a88e-de8aced210c6@quicinc.com>
Date: Tue, 30 Apr 2024 12:37:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv4 3/3] wifi: ath12k: Remove unused tcl_*_ring
 configuration
Content-Language: en-US
To: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240430091414.2486196-1-quic_tamizhr@quicinc.com>
 <20240430091414.2486196-4-quic_tamizhr@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240430091414.2486196-4-quic_tamizhr@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4lxJM519WfVfpTMSzkjo4rOAxQnqZos3
X-Proofpoint-ORIG-GUID: 4lxJM519WfVfpTMSzkjo4rOAxQnqZos3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_12,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 mlxlogscore=981 phishscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_123802_904174_C1F84702 
X-CRM114-Status: UNSURE (   8.16  )
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

On 4/30/2024 2:14 AM, Tamizh Chelvam Raja wrote:
> Currently memory allocation for multiple hardware rings done
> in host as these memory will be used by firmware/hardware.
> But in case of tcl_cmd_ring and tcl_status_ring neither firmware
> nor hardware uses host allocated memory and it uses memory
> allocated by firmware itself. So avoid tcl_cmd_ring and
> tcl_status_ring setup in host.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


