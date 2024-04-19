Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82F4C4345F
	for <ath12k@archiver.kernel.org>; Fri, 19 Apr 2024 14:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7PwKIillDqW2PxE/69AtrzMGuZqPPLn8J52Rt2ukngE=; b=hx9HCvh8gZOM/ypeHy2crMr6s8
	gVxU3Hbh9L7zni5gHEYnjNh599S9KG75nrA2THZNf5X/XU0SGS7qLeqaQxEHEejPSLJeX0jBEh20E
	GyPJMGFIJAzltBnBGqvT9/wdaEiB+UHoXmGnw4iOAHGpbPMPFM2WRdhy9Zhj/NVU5r26X9H5lebDA
	Jo1RBd8yIjbpLrM90eCHp0WAu9G6i9f7m2BggwcaeJsPBRD5u0pJ6Sa3IFHkXLJ1GWP438XLA99ts
	maAuOy+l+0DjeRp46dvS3C/+Xe5Upj+1TNoMwnLneNEtIkmTu2UBese5l+CWiTDsA/9dGWNfOkdc9
	4NlxtZXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxpeN-0000000637m-2nEs
	for ath12k@archiver.kernel.org;
	Fri, 19 Apr 2024 14:55:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxpeK-0000000637G-3zbM
	for ath12k@lists.infradead.org;
	Fri, 19 Apr 2024 14:55:38 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43J9R8DT020722;
	Fri, 19 Apr 2024 14:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=7PwKIillDqW2PxE/69AtrzMGuZqPPLn8J52Rt2ukngE=; b=iL
	xXh+7nJ8AxGTYdmPCplbpr70XR86pU/p5iKiDDzBsztH7+M5IcQs+9h7ecuL6RbQ
	qg1IrZqoLGE2JFVmIUP9VUq9uJQH3K+mB2ldFrUnI6lgjUkSgaDAqwpK+FH1degw
	Q8lPVHXjG1HxAEXMG6VJUpIFSNG6Wg3t+PpSNjg7xvkN0+VAFlpehxJA8shGkQNm
	2S3NsSRZejZEun5fMQhBK7PcwhdmF69ybJCEgQbvn5uxLyoMta/p6iZBDv8mlM3m
	sBCh+NJ4qfHHRUs2fnWHkPr+vmJYc2TY11vbvkpj7pVPAfyI+DpPK4KSxRRmDKvO
	xhtk7hHw2/gZTn9gK0Ow==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xkgd71ag9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Apr 2024 14:55:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43JEtY0F005389
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Apr 2024 14:55:34 GMT
Received: from [10.110.56.161] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Apr
 2024 07:55:33 -0700
Message-ID: <edda92e8-0508-4028-a3c8-392355436c43@quicinc.com>
Date: Fri, 19 Apr 2024 07:55:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/4] wifi: ath12k: ACPI band edge channel power support
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240418162019.1246749-1-kvalo@kernel.org>
 <20240418162019.1246749-5-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240418162019.1246749-5-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vweodLGXdPW15VmYVV-kR33CQtafbVSQ
X-Proofpoint-ORIG-GUID: vweodLGXdPW15VmYVV-kR33CQtafbVSQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_10,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=888 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404190112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_075537_295777_65429DF6 
X-CRM114-Status: UNSURE (   7.32  )
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

On 4/18/2024 9:20 AM, Kalle Valo wrote:
> From: Lingbo Kong <quic_lingbok@quicinc.com>
> 
> Currently, ath12k does not have the ability to set band edge channel power
> for WCN7850. In order to support this, ath12k gets band edge channel power
> table in ath12k_acpi_dsm_get_data() function and sets pdev_id and
> param_type_id, then finally sends these data and
> WMI_PDEV_SET_BIOS_INTERFACE_CMDID to firmware to set band edge channel
> power.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


