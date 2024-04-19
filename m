Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22FFCC4345F
	for <ath12k@archiver.kernel.org>; Fri, 19 Apr 2024 14:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rWRnm8azf1sydL4ncq7o+kY1QatMq+6Hzv3zqm2S+7k=; b=DG4NSL3hl5+LKBDzdti2Q0QEkn
	FuTNLcc3QFM2sxZ438wIwNV1t7wB/rbKgEXmzIr/13k6eX+hBFauDRhHP9Rs/qhGVvb1weIo+c22b
	4XZCOi2SOqRg0FzIMvtY6yncJSZONVFDxC0fa0hnGF7IIxCSg4vEfGOl7lNpms6CA3s6lal0P5cOl
	M2hzCY04GE4HOXPdc557ubkwKiHtRqLvnCzzLdCZ7jexw60tuJTbnvVw8inCHHQyWF25BdWX5AoWR
	0H7y8Jjbzl0GLUEFobv6V94DQYF7mF3ivpG5RuOJ4eajrBOh4H+6ZUWTm1REw2cUfsswFxv18uxGn
	eiGNjTCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxpdr-0000000633L-3bud
	for ath12k@archiver.kernel.org;
	Fri, 19 Apr 2024 14:55:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxpdp-0000000632v-1X14
	for ath12k@lists.infradead.org;
	Fri, 19 Apr 2024 14:55:06 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43JCaEgh029208;
	Fri, 19 Apr 2024 14:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=rWRnm8azf1sydL4ncq7o+kY1QatMq+6Hzv3zqm2S+7k=; b=He
	akk5dJGr/FubCWGoNBgyMplPRLLFEBj53BCOnipte+9e3+fz7v/FTX9NpTb8mT0k
	tP5Wqzgx3zGaelo2nR9tEi+EOCoOr2HTTNO0SDh6mdZkT/pYt67ffmQhg2Ebks/S
	ltklsTOLdwggjncpJAeOGlBH/tDE6x7vUdDPtl8/XzhYZdZV9hXXi6leQ6+UkKoh
	HY9z9D2TgCRYSbG5QUBUrpfOItkc1gSvcp2hPJm6LI4rHNlMr3fawmKxbp/QnfHX
	H1SEDpor2Ng8CMRmZIR9uhJiHjvatx/tj7zskRIrHEAvW8Rn4WQUu1i4WXEvAEWB
	mgBgKpdyiikWc8asPORQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xk9s7a3rj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Apr 2024 14:55:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43JEt22O000668
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Apr 2024 14:55:02 GMT
Received: from [10.110.56.161] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Apr
 2024 07:55:02 -0700
Message-ID: <b2c4dd7b-f0c5-447b-bc2f-b1acb3a9f2c0@quicinc.com>
Date: Fri, 19 Apr 2024 07:55:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/4] wifi: ath12k: ACPI SAR support
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240418162019.1246749-1-kvalo@kernel.org>
 <20240418162019.1246749-3-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240418162019.1246749-3-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0uTfFWec4Vc9k0b61__ksvVzY2UR0WaL
X-Proofpoint-ORIG-GUID: 0uTfFWec4Vc9k0b61__ksvVzY2UR0WaL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_10,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 phishscore=0 mlxlogscore=903 priorityscore=1501 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404190112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_075505_446734_2E651C0B 
X-CRM114-Status: UNSURE (   7.20  )
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
> In order to enable ACPI SAR (Specific Absorption Rate), ath12k gets SAR and GEO
> offset tables from ACPI and sends the data to firmware using
> WMI_PDEV_SET_BIOS_SAR_TABLE_CMDID and WMI_PDEV_SET_BIOS_GEO_TABLE_CMDID
> commands.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


