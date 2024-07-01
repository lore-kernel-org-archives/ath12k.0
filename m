Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AADEC2BD09
	for <ath12k@archiver.kernel.org>; Mon,  1 Jul 2024 23:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZOSybswH8DYxlG3T1ZI5UoyHgjKSha7erN55ScJYUI=; b=mSsCaSaZotFtGptdeDVH6tU0Ik
	ZNhLx8MTwo2F5DugnCjYnLDdKDecJSWkqvVXxBvtco+WoVm7kUtTJ+OeeTx+K9K2CB/CAssDMSvWF
	pV9ny81gVTkP/DFz0A80jK425J0x76XQbe40awHBuBWAil66otQ0PW+MGgHAk871TRUzJG5+qceIK
	SzGv+IIQ8niBfc+PG7orOcWLXI3LMdpaPtmZLRIGsxXOeMY7c9nRFRnOLNULCdVxmTErC1FIXRhIM
	9s+K5usRV2XPxRZaH/PMNZcDaIwc8qn5u9u5y9VT8GTloeX2C7olcnZhP1DWkldiO/jdZ4W0GCmBH
	f06xJX9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOQej-000000056Ia-05fn
	for ath12k@archiver.kernel.org;
	Mon, 01 Jul 2024 23:41:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOQeg-000000056Hp-1KRk
	for ath12k@lists.infradead.org;
	Mon, 01 Jul 2024 23:41:55 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 461BbmK8010891;
	Mon, 1 Jul 2024 23:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lZOSybswH8DYxlG3T1ZI5UoyHgjKSha7erN55ScJYUI=; b=WITem647JXQIW5eQ
	AG1yYAdWaLZwbN42JHDdz6uAkF3uKo1NZdkTc15iPr+LHAFJqzpD1MNHk/8Q+CXn
	NIbtVDnfAwE+YgxO6T8ynv0Hx9c0pHuO9FyZCBCsA1adE4Mev1L7ZnfuesHqJSv4
	SvLmrM4A94IJCmK3anH5V7JqrHvobVUzoWet3PkQmzzKQtTF4hgM4yV97PjsSHw5
	wUuYW1syBGu4TluZNL89dE6+/AdV0QpCiRY+SUYqeGRimgbgAGtVu/TZEd2FjKU4
	elkSNbHgcgvPfGo0EBFOyIyBLbestq6j2wMrT/1YSJdqAWdl8g1lJNLdHChnsjqF
	rlR3Eg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 403kj8tr0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 23:41:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 461Nfq0x017635
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Jul 2024 23:41:52 GMT
Received: from [10.48.245.148] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 1 Jul 2024
 16:41:52 -0700
Message-ID: <c0fdb440-17c6-4e6b-ba9f-87f13f31e4ed@quicinc.com>
Date: Mon, 1 Jul 2024 16:41:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/8] wifi: ath12k: Introduce QMI firmware ready flag
Content-Language: en-US
To: Harshitha Prem <quic_hprem@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
References: <20240628095139.292952-1-quic_hprem@quicinc.com>
 <20240628095139.292952-5-quic_hprem@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240628095139.292952-5-quic_hprem@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rN_SMDZ7bSp38_S4EG-S8IQ7jGJ0Qf4y
X-Proofpoint-ORIG-GUID: rN_SMDZ7bSp38_S4EG-S8IQ7jGJ0Qf4y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_21,2024-07-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 clxscore=1015 mlxscore=0 mlxlogscore=791 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407010176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_164154_395873_68D7AE96 
X-CRM114-Status: GOOD (  10.47  )
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

On 6/28/2024 2:51 AM, Harshitha Prem wrote:
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
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



