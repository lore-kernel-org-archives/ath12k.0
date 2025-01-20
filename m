Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23250C02185
	for <ath12k@archiver.kernel.org>; Mon, 20 Jan 2025 04:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQqyqhC+8kJq6URhxe/lqVqGXYJ76Le3m+zYxXE5tko=; b=BFPYlXEC/QKMKYlIdFL7tDt1AQ
	MywlYUwcmeajVozBHVVta+Tqvy2aw/Kdx0C4IWYvqFRzREHW1pWU1tFafdy4W8WLXV1avQ2cC4S/V
	RsJDH3olEYAFSViQcMYTWP6Cm/XTerIRbQcIXqwbEmDvWOYAbMvrTTO5CJhibLYhEFqskWwWKJbdj
	Sl7MjKPiOeFZk2B9UTkpirPIY04r4FYPQnh/17lM8+vKyV+JlAQFi0yJLRvehMuPvqouuB4ty9ye8
	96EBQTUWoeK8SDx2+L9Bkxd0zLcE6+2jdtlBRN4TDIR0293GC/+f98oGBsyDK7VlEGCL1ZYd3XZ1L
	1O+YtFtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZj67-00000004gs3-3Ebw
	for ath12k@archiver.kernel.org;
	Mon, 20 Jan 2025 04:09:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZj64-00000004grX-1NqN
	for ath12k@lists.infradead.org;
	Mon, 20 Jan 2025 04:09:09 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K0NB1u023530
	for <ath12k@lists.infradead.org>; Mon, 20 Jan 2025 04:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nQqyqhC+8kJq6URhxe/lqVqGXYJ76Le3m+zYxXE5tko=; b=DUfdGkWbm3+KEyPs
	ZYyhXBeuSowdqK9UEKed6b0pzcIU5m+tM8KCtRRpai2MB3COG3dJC9gnBuC5s3B+
	HDf+J6mzfmK7ZDIXiPyaYBgaWss0MVcDvKc1FSyAQIKQ5y9aWgtUx5WZIi+LeTmT
	fJa3ejjjGWjVzvgzF5cq6AWm+KBwFoea8KpYwsPqL0d1CcMsi0Rpp9z6mAhmJ9m+
	UkM5uXm7K2J4wuu1b3k/u8tbjnlDOpmBc37Ia+Xms4zO8g5yeDgtiwBPRy8f2F1C
	duSqj3zWKPHZQ3adlvJYjKDEmNVNJPTyGl713hEm2Y/v9umC97Gljl5bM1pFUWyx
	E95YpA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44852d2xuu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 20 Jan 2025 04:09:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50K497Jv026583
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 20 Jan 2025 04:09:07 GMT
Received: from [10.152.202.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 19 Jan
 2025 20:09:06 -0800
Message-ID: <e2a60856-9390-47cc-b9a5-d38a26a56c8e@quicinc.com>
Date: Mon, 20 Jan 2025 09:38:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/4] wifi: ath12k: export ath12k_wmi_tlv_hdr for
 testmode
To: <ath12k@lists.infradead.org>
References: <20250119083657.1937557-1-quic_aarasahu@quicinc.com>
 <20250119083657.1937557-3-quic_aarasahu@quicinc.com>
Content-Language: en-US
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <20250119083657.1937557-3-quic_aarasahu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WgjmN6CtwHjNKBJaQ5HFNzGCLdBC_9e5
X-Proofpoint-GUID: WgjmN6CtwHjNKBJaQ5HFNzGCLdBC_9e5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_01,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 mlxscore=0 phishscore=0 mlxlogscore=721
 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501200030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_200908_906655_1DF8D08A 
X-CRM114-Status: UNSURE (   7.08  )
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

On 1/19/25 14:06, Aaradhana Sahu wrote:
> Export ath12k_wmi_tlv_hdr() to further use in the testmode command
> processing.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu<quic_aarasahu@quicinc.com>
> ---

Reviewed-by: Aditya Kumar Singh <quic_adisi@quicinc.com>


-- 
Aditya

