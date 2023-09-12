Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A1BEE3F0F
	for <ath12k@archiver.kernel.org>; Tue, 12 Sep 2023 19:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hr9a59jNBOatJSRYsjlY14OkvGQ2dRqgnGSYgWKwcKY=; b=42P8Fl8fGhK4ku
	pDrnuShQdNXGh09tS5yzCA4gdAoizbnlmsADzPKlYodgPXxcEYO6TGvKKOPZMdVpPGa4nuagrA5r9
	3Hsn3MwDBy3qxLS0T/wYNs4LMhd0jVxxAg2/XWQyia6bY8RJdqtZZyXLr1DHRq5I3swGKGTDdJZjQ
	mVlLNUXKP4BL6x62PGmXSzrXvV4viwiNXIFgremhYX3S1YDWGfjVO2XwbfXDLtL++qLCjH0tNJMG1
	9EcO/YzvEcdeNfYLiyMxoR3UGBKD+yiVqjhlyAvB26MPSThvdyX4khfTRT2IsP6TQS4DYDYveY4i3
	tVKbYRPCmjxhFTTBw2mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg97Q-0042ze-0e
	for ath12k@archiver.kernel.org;
	Tue, 12 Sep 2023 19:32:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg97O-0042yU-0g
	for ath12k@lists.infradead.org;
	Tue, 12 Sep 2023 19:32:15 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38CJUPlM031521;
	Tue, 12 Sep 2023 19:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=HnvrtqBO/9G9R4p6dGRo3CzSdAdjy4K9Uo4grds356s=;
 b=Lp1iUGkpg0ZhHQ8Dy9Bkj+ApXQ/NXDiuMgpxLDAljRaahrbNMeE6ACFG5kZR3SMZKgOy
 pVqjhp6izX070ilXEaZEYo58q6c76rgFQHx9xXbj5/zDPk0gtrdD+1qmQnpwLSmyK0SF
 Q5EtHQk182Ufw51r9y4KJ56D0DIXuVUnmnH7MXmuW/Ap5BNHR88dHb7OcwKJnY/Rn2sh
 RbsaKbbGYoXJpZkNDYecwftne0zGeuou6J7XgKlYYau0oHBPjljKDUhobmFD+NLZ8ej+
 mXDxN2CEf8v6UFJ5RnBT4ThMZWGq5ua8jd9zPabMwqQPrTyTb3vncz/mjU+oRw76QUfd fQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t2qkj9ccs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 19:32:12 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38CJWCth017729
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 19:32:12 GMT
Received: from [10.111.183.71] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 12 Sep
 2023 12:32:11 -0700
Message-ID: <f05b4485-397a-4758-b0de-c2136bc665ec@quicinc.com>
Date: Tue, 12 Sep 2023 12:32:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] wifi: ath12k: add BIOS SAR capability for WCN7850
Content-Language: en-US
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230910082802.9198-1-quic_lingbok@quicinc.com>
 <20230910082802.9198-3-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230910082802.9198-3-quic_lingbok@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: y6wR6NH9tLasx43okgdcJQGpCumc5CAA
X-Proofpoint-GUID: y6wR6NH9tLasx43okgdcJQGpCumc5CAA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_19,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=729
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309120164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_123214_250807_96031468 
X-CRM114-Status: GOOD (  12.55  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 9/10/2023 1:28 AM, Lingbo Kong wrote:
> Currently, ath12k does not support BIOS SAR for WCN7850. In order to enable
> BIOS SAR for WCN7850, ath12k gets BIOS SAR table and GEO offset table in
> ath12k_acpi_dsm_get_data() function, then sets pdev_id, length of data, and
> finally sends these data and WMI_PDEV_SET_BIOS_SAR_TABLE_CMDID and
> WMI_PDEV_SET_BIOS_GEO_TABLE_CMDID to firmware to implement BIOS SAR during
> the initialization phase. Besides, ath12k registers an ACPI event callback
> so that ACPI can notify ath12k to get the updated BIOS SAR table and sends
> it to firmware when the device state is changed.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
