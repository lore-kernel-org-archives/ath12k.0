Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9312AC4345F
	for <ath12k@archiver.kernel.org>; Thu, 25 Apr 2024 21:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8qniK0GV8+DYQ7mcf02ansvIb8STNUldfK/nlnx1Bg=; b=PqObcLRfKfc3u9qmh2cuUMgE50
	U1nt7cRIYXm/l8MVEMDXnGjYqVgg9KkfQkSeaXSzN9mlXYLB/fYBISpRjypzw1Vj/ZV1fOJQXukil
	dNgsIY9ErF4Q4RRWY02lQUWhuto/6YI81WPxSSGHr5KZkHnMIxCDRhCKoqShKT2OOdEPUALNDeeSE
	GAn2VzgAN2Eb/0MxbIqUJFWs8/nUVjAuS/vG04uBry+sAjyXk5uMWRfxoaN+vSUuCCqfl42aCsUZh
	i7Z7pET51U3BidlQ5uu0iq7+eiZv5NZ9Z33a25DgITyxKlTk9BnJZBsfCJDsn9D2R3qoL+dlTNwDA
	1Ji1WqNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s06eG-0000000AG7H-1N2A
	for ath12k@archiver.kernel.org;
	Thu, 25 Apr 2024 21:28:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s06eC-0000000AG6f-3j4T
	for ath12k@lists.infradead.org;
	Thu, 25 Apr 2024 21:28:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43PLBpjv022526;
	Thu, 25 Apr 2024 21:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=p8qniK0GV8+DYQ7mcf02ansvIb8STNUldfK/nlnx1Bg=; b=D/
	09Q+bwsPVPi+X7ULpHjtp2Q+3g0WlbI9NeQsR83klM+k2BIINcieLeOqMio9Bg4m
	Bs2ZAS1PnUA+O76A7zUzvB89nFjguTAUQSlsxIcwg8KRJTBMZazyT8yuD5nSaQ7m
	cUsf8klak6qRf4YUo76NWYvBsVZMCpqrPE8AExuCEUKtDpmoLPxXMWR569IZyalq
	WeAqvFfoP0kvjrBHZ986v9f0CQd1X/2AETCkc9W6b2CTgesNkho10mfLczMIGDbH
	YGQ9/JC6DVuW4UIHFuOjCJt2Wzltq02Veipgo5lh3Du6SxNcusXwMLW3UZTVS6Ol
	s8/OQr4VBWvj0T2Nz69Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqthv0mpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:28:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43PLSoPE031113
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:28:50 GMT
Received: from [10.110.61.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 25 Apr
 2024 14:28:50 -0700
Message-ID: <8cec374a-261d-4b42-ae56-98f12663cbbe@quicinc.com>
Date: Thu, 25 Apr 2024 14:28:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] wifi: ath12k: Introduce QMI firmware ready flag
Content-Language: en-US
To: Harshitha Prem <quic_hprem@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
References: <20240425055759.1181165-1-quic_hprem@quicinc.com>
 <20240425055759.1181165-5-quic_hprem@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240425055759.1181165-5-quic_hprem@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CCelMZf_ifbKjCAo1xIcl3YnDDxIRptx
X-Proofpoint-GUID: CCelMZf_ifbKjCAo1xIcl3YnDDxIRptx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_21,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 phishscore=0 suspectscore=0 bulkscore=0 mlxlogscore=796 malwarescore=0
 adultscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_142853_441273_921E9E12 
X-CRM114-Status: UNSURE (   9.86  )
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

On 4/24/2024 10:57 PM, Harshitha Prem wrote:
> From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> 
> When hardware device group abstraction is introduced, QMI firmware
> ready event of different devices in a group can be received simultaneously.
> 
> To indicate firmware ready event is completed for a particular device in a
> group set a flag (ATH12K_FLAG_QMI_FW_READY_COMPLETE). This would be
> helpful when hardware recovery is introduced for hardware device group
> abstraction.
> 
> Add changes to set/unset ATH12K_FLAG_QMI_FW_READY_COMPLETE flag for a
> device.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



