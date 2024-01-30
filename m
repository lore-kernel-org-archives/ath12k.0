Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190B3C46CD2
	for <ath12k@archiver.kernel.org>; Tue, 30 Jan 2024 17:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCvOTW2vL+gvjIXj2EV8KTJfzfGFt5pO4cWF7soE7KA=; b=MwJaEkwV0PhfYq1OKiLHTpWyGc
	ocpB0LV92ri/NrdH0raLEl1aAGaGfk5csAubFBerbOdhNzUCxd7YlpGWsTYR/Ga6M/UDhtCEIYL9N
	XTJ56eMy0cDGlZvUVV9IrE9JsKTt6WwKqHQ8uLOMWC4ZK5SwD5CwJ9Q2viECNPfjDFNsq5HxNVxth
	5gqygJ6JsSX1heQcQ7utgqpLSUkF+1oO857qLUqCJbvy+yI/ERh/13Ab+PA7LJ7gCC4qhilqAtBcP
	04be4eGeao2mJykSnqloEZYLdg5VyW3ebhjPkGvac+UTBUIkstT0HxZAH/0WT0m6n+kh/lb69uMUB
	vDbb0l1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUriO-0000000HWr3-3M0J
	for ath12k@archiver.kernel.org;
	Tue, 30 Jan 2024 17:16:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUriN-0000000HWqg-0Np9
	for ath12k@lists.infradead.org;
	Tue, 30 Jan 2024 17:16:04 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40UHCR9T021092;
	Tue, 30 Jan 2024 17:16:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=DCvOTW2vL+gvjIXj2EV8KTJfzfGFt5pO4cWF7soE7KA=; b=g5
	lk1OSHjwGUQALIz/Jvha8Z20Q+ZvWz7q0RZX3l9kbdD601xicruZ8T+xmQFrbzUs
	Zzmrxs0DESJOdjGUoCjEIAZQf78oNHqc1614VbPHwolHufXbFwCGVVWRurUd+VMC
	ln9igi55jjaJftS88hRqL4heiXZxWuALggQJ83PHuXX4EzHDN7zqSfLad3nOiIkL
	mk5rnfb/UvxAG2ObKZex0Ym88NvM4vm5ptb9EyewcDFKToEt43kkY4FxJXzkSdL9
	VTXta/gQMY0KMHvS4UxRtJGkwlrKZTQBo3Ssgxklc8hRCW+l8C+rOMxhXRMbP60R
	2KgCYSFgDj+t8GNlESQQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vy4rq82yg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 17:16:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40UHG2fj028436
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 17:16:02 GMT
Received: from [10.110.47.232] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 30 Jan
 2024 09:16:01 -0800
Message-ID: <6cd96388-a832-473b-bf4e-cff7b8f5a121@quicinc.com>
Date: Tue, 30 Jan 2024 09:16:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/11] wifi: ath12k: implement remain on channel for
 P2P mode
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240130040303.370590-1-quic_kangyang@quicinc.com>
 <20240130040303.370590-7-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240130040303.370590-7-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dFOjzrInLoJA82Ux_0bC-zvQ9ImuZUic
X-Proofpoint-GUID: dFOjzrInLoJA82Ux_0bC-zvQ9ImuZUic
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-30_08,2024-01-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0
 mlxscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=596 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401300127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_091603_167169_EE041258 
X-CRM114-Status: UNSURE (   7.11  )
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

On 1/29/2024 8:02 PM, Kang Yang wrote:
> Implement remain on channel for p2p mode in ath12k_ops:
>         ath12k_mac_op_remain_on_channel
>         ath12k_mac_op_cancel_remain_on_channel
> 
> P2P device can trigger ROC scan. Then keep listening or sending management
> frames on particular channels.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


