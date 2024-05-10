Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DEEC10F1A
	for <ath12k@archiver.kernel.org>; Fri, 10 May 2024 02:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=umFSg273GRiYiXykMx/zI+GS5+NeuEZfrTB+UlN1tYI=; b=cazbiF2bNP2J0NyNAxB5gkA/nS
	Fsqt2SPMlYENgq/22+fgplHlBORujvbMXl7bxNS0wrAuoicMRV/au+G83OUqeYa4eKsbo1mLynS7S
	b0SNiNOa87+7vQvZIrgL4rH6LPABwcDTTjcy/AOIheVKO1Ec0Wdny916tpNPb9Mm6NYEHAoEesjYw
	O4xhCEGnp1RKK8DQ1d+LDlRApN1kZYJD7JwulVJpn4WKUBf81I3b41jY2NPHIjSjOlsWG6O7am99y
	Z2B0y/7pdaHJGlOozw/98oWGcg5pOzflo2aFvTiCtqXMmxzxKXukWEtmxQ2cW2/FWOQRouao0YXTC
	9dyBOHnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5FoO-00000003irA-2eD5
	for ath12k@archiver.kernel.org;
	Fri, 10 May 2024 02:16:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5FoL-00000003iqd-06ul
	for ath12k@lists.infradead.org;
	Fri, 10 May 2024 02:16:38 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44A1Al4V002547;
	Fri, 10 May 2024 02:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=umFSg273GRiYiXykMx/zI+GS5+NeuEZfrTB+UlN1tYI=; b=FO
	1atUtL2q4NBCiyVZpzViYdeJ2IePXot1VPpwM/PRC9L4xN3EGSr65mXJ8Z7HjrF7
	s/43jSrluudQGRlRriZNMrdMTGwW670Z8Cp+VoSRCbp+oB/5yGyJchl+Rcqxdu8l
	CAJZVmHkPDwwnSgN+VJ5kQ6+cpuAcAuC27NyBobnN55xXaBL5iLJVo870w95rvWD
	wHtm7rKsMls/cZpPpNUqUkDSv36MIG0H2/X1f6cOxBTeZLSTa3EfN0B1TWYRwOzm
	BRA9YuTEoyQ1RkD6NPPcjVAJ024hJt3IB0NjoxnWugDIyAYtaXhVpniCQmpZKE7o
	V87axwQLH/kAY77q+syg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16w18bun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 02:16:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44A2GY0p026997
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 02:16:34 GMT
Received: from [10.110.100.57] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 May 2024
 19:16:34 -0700
Message-ID: <7d7701ec-c7c0-4bc1-a2ed-5d8085e7f534@quicinc.com>
Date: Thu, 9 May 2024 19:16:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] wifi: ath12k: Add ath12k_get_num_hw api
Content-Language: en-US
To: Harshitha Prem <quic_hprem@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
References: <20240507045702.2858954-1-quic_hprem@quicinc.com>
 <20240507045702.2858954-4-quic_hprem@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240507045702.2858954-4-quic_hprem@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gWgcYx0Vd8c36ttgPPSXfpjpEwPYYh4R
X-Proofpoint-ORIG-GUID: gWgcYx0Vd8c36ttgPPSXfpjpEwPYYh4R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_01,2024-05-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 phishscore=0 mlxlogscore=606
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405010000 definitions=main-2405100015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_191637_170195_04B2B0D1 
X-CRM114-Status: UNSURE (   9.81  )
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

On 5/6/2024 9:56 PM, Harshitha Prem wrote:
> From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> 
> Currently, one or more ath12k_hw is part of device (ath12k_base) but
> in future, ath12k_hw would be part of device group (ath12k_hw_group).
> Hence, num_hw under device would be moved to device group.
> 
> To facilitate above transition, add helper ath12k_get_num_hw() api to
> get the number of radios per device. In future, this helper would be
> able to get the number of radios in a device group.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


