Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C9ED4921C
	for <ath12k@archiver.kernel.org>; Tue, 19 Nov 2024 06:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZnH/C4BZk2gZPof/aRGd1hwMaC66o9eYIWKMrnHlOs=; b=Ac1pnaH2UeUZgwz7RyBL6VXXq2
	9ArCtKDUtOGBJ/u16pMXTL5BWP1RY2k0WQZv7IMD7l4KuU5kUSosc0nghMUEMTfBUUl/7ych8Ziks
	zNOwNOEpybMOlpCjpWu63txiqtNYucLOwLbLjTuoyw2hc60lzIpPkmyH+i5Lv6dhixNx+OrxkZ2tk
	4fdP/DnMOW990wPBA5vWzE44a5QeYX7M9CvNDipMjgYvXzDo8urG3nO2Ai4Ls3pV5cVQEltMPzskJ
	yBnAub1k+FaGucUY+lTPGYMD5KJpj1QfAxU1KiIHofTDcJV2wZecTnwTP0BOJ/IX5nImSNOxHJ5vD
	wr0uDGZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDHLG-0000000BU0P-3lPV
	for ath12k@archiver.kernel.org;
	Tue, 19 Nov 2024 06:04:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDHLE-0000000BTyS-0E9i
	for ath12k@lists.infradead.org;
	Tue, 19 Nov 2024 06:04:01 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIGGc6T022350;
	Tue, 19 Nov 2024 06:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rZnH/C4BZk2gZPof/aRGd1hwMaC66o9eYIWKMrnHlOs=; b=kUJWTdjWchNOwtfN
	SFAtcxZVgWno+lpc2UcT/mTeHwEkUrYbI5ZK4Xxjo5J/cJkmdKASXqV/bVx5UdH6
	lWvCalIoCsOTMDG1sWa5wUY83vCiZMmyWkMXvRTTkXpNI0tejYxAJP2Kp9vh3Jn8
	zcAubNnKnT5iely+6BhToVZx+khZq9jLQgaoKQ+b9D1m3PqfdyhRUSKjjquuF3d7
	tdj+VMSrcixFl9h2MEiRbftvFO2ltkkhWw3W3Bjk1sOasMlvSTXsFuMa87Scfe4P
	wnJQ1GmdQcDanYd/rc6CFXyYiHtBqJlhXuYIwQBqdXG+ZQLtcl8vWB35sdegyp9V
	H6N1zw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y61j2h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 06:03:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJ63xsK010233
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 06:03:59 GMT
Received: from [10.111.176.82] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 18 Nov
 2024 22:03:58 -0800
Message-ID: <3b7aec30-ac7b-49c7-923d-966eadbdc8fb@quicinc.com>
Date: Mon, 18 Nov 2024 22:03:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] wifi: ath12k: Avoid explicit type cast in monitor
 status parse handler
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241119003248.1579567-1-quic_periyasa@quicinc.com>
 <20241119003248.1579567-9-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241119003248.1579567-9-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZpttltOSTe3EQOil2oxWYGZruKiHV-sk
X-Proofpoint-ORIG-GUID: ZpttltOSTe3EQOil2oxWYGZruKiHV-sk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=839 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_220400_102227_CB9C3FD0 
X-CRM114-Status: UNSURE (   7.09  )
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

On 11/18/2024 4:32 PM, Karthikeyan Periyasamy wrote:
> Currently, monitor status parse procedure handles all the supported TLV
> tags. Each TLV tag has its own data structure for parsing. Now, this
> handler is passed the tlv_data as a u8 pointer, so explicit type cast
> conversion happens for every TLV tag parsing. Therefore, avoid the
> explicit type conversion by changing the tlv_data type from a u8 pointer
> to a const void pointer.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


