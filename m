Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F59C2BBCA
	for <ath12k@archiver.kernel.org>; Tue, 25 Jun 2024 19:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=69sDzaX7rCcOq1EA3vHdocLJuTsyaOcp5s6CbijiW0I=; b=jTEXumlPLq0QA0XyOBVL5S+CP/
	CtkH6QBi4xNx4L4O7brMv66Qyx8b3KgrCy1i1LLujJTyaQvAz+Pq3R4QqISigLzzVG4+ZysjZb5Y8
	bSPAp1/1QklEfyww0tAkJn+os5psZn2r1KMddRGAe9Z0N59b6MMJe7X8UFmAg9i8DlChFB+eeSZOy
	BnSFFLL4OC9LZdIFsD1cuTxLCMZlqC2ijeRq88a4aVA/ROVZlz5jXm+GNZe8sIq6gOzGJwjyrULjU
	l7D1+ctpf54mz7iBl89jevfE5C7Om5EAA/eUgjGMFwqbP1X1XdeHG+d7RnEq0oepAJvcjka52CVfs
	tGIMOAyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMCEO-00000004Izl-3Y0y
	for ath12k@archiver.kernel.org;
	Tue, 25 Jun 2024 19:53:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMCEM-00000004Iz0-0CXc
	for ath12k@lists.infradead.org;
	Tue, 25 Jun 2024 19:53:31 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PHUZEL024767;
	Tue, 25 Jun 2024 19:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	69sDzaX7rCcOq1EA3vHdocLJuTsyaOcp5s6CbijiW0I=; b=QAD+nxaMKb95GyU3
	YouwbJCE4qn0r3/am8wIhiUc9bnivLtT4+FQWH4qbeRJWLEhITHCdRfOrFDYsodZ
	Uim64mSo/L6tdSwFAGB+K6QCfqU1OvqSXVNMsfLp+Jwiv/U1lCdQadHcG1xVI1rO
	l9JFAp7B4cvh6mcYKjd71HPGWvgcic+S3akf9aqH/CYKz0jPYw4LnIr94s9XcgZy
	Wm8ajxcfcjOqKXjxRfbj9xg2Ws9xtjeJYXz4CSObLa/1PzZnrfnBlnwaM/nnbwfB
	xWBGUD0vUlJ4CWbl3eKLtQtlaHyamE5jNvOy9t3U4hMKAH9clZGT9EyyKN8fJp4q
	2k8dNQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywqshqn51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 19:53:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45PJrSoB006287
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 19:53:28 GMT
Received: from [10.48.244.230] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Jun
 2024 12:53:28 -0700
Message-ID: <67c34e28-d763-4f63-9ee6-ccb5721c49a5@quicinc.com>
Date: Tue, 25 Jun 2024 12:53:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] wifi: ath12k: Support TQM stats
Content-Language: en-US
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Dinesh Karthikeyan
	<quic_dinek@quicinc.com>
References: <20240625042217.1303332-1-quic_rdevanat@quicinc.com>
 <20240625042217.1303332-4-quic_rdevanat@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240625042217.1303332-4-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1yL8Ur0BdTertmReGynhln_T7AENL8A7
X-Proofpoint-GUID: 1yL8Ur0BdTertmReGynhln_T7AENL8A7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_15,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406250146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_125330_135932_884B2430 
X-CRM114-Status: UNSURE (   8.26  )
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

On 6/24/2024 9:22 PM, Roopni Devanathan wrote:
> From: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> 
> Add support to request pdev TQM stats from firmware through HTT stats
> type 6. This stat type gives information such as TQM error, MPDU
> related information and TQM pdev stats.
> 
> Sample output:
> -------------
> echo 6 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> 
> HTT_TX_TQM_ERROR_STATS_TLV:
> q_empty_failure = 0
> q_not_empty_failure = 0
> add_msdu_failure = 0
> 
> TQM_ERROR_RESET_STATS:
> tqm_cache_ctl_err = 0
> tqm_soft_reset = 0
> tqm_reset_total_num_in_use_link_descs = 0
> .....
> 
> HTT_TX_TQM_GEN_MPDU_STATS_TLV:
> gen_mpdu_end_reason =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
> 10:0, 11:0, 12:0, 13:0, 14:0, 15:0, 16:0
> 
> HTT_TX_TQM_LIST_MPDU_STATS_TLV:
> list_mpdu_end_reason =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0,
> 10:0, 11:0, 12:0
> 
> HTT_TX_TQM_LIST_MPDU_CNT_TLV_V:
> list_mpdu_cnt_hist =  0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0
> 
> HTT_TX_TQM_PDEV_STATS_TLV_V:
> msdu_count = 0
> mpdu_count = 0
> remove_msdu = 0
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


