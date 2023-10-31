Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9D5C4332F
	for <ath12k@archiver.kernel.org>; Tue, 31 Oct 2023 01:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DKFDxMGOQKq2XmDWSCkhu3cV+aAYJd5kjBAWLaNqRfk=; b=KNhrNjq6GBHZyF
	qFrBKhl6LtYJGFnmZ63ej9gXWUeF3C8KgHcUbJvuZiZNnHkavIKQnX6Os3HNXMPkdvUQY6fjw3pif
	85x/iDQM4SUnHvQWtgKtY3Ps9mNkY76nqZXhR+yIpKzCB1h1cH7vYfJtNWD2JaXClP3GjVx/rP5j0
	7rHJ6bHRXdVRVwLdsdIvt62HbcBQCDwinSmtp0UKTFd11tbMO58k0hSYR9bMtlhUBCPB/Br8qBYip
	onvNnE0SGykekP6HMZj2mWco+T013d8lMzolPQiru2Q4Zxjkxvpd+Sq8zs1m0agl8OpRKuYfa8oU9
	2cmD06R9T6wyQB1pq4eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxdBO-004LKR-1M
	for ath12k@archiver.kernel.org;
	Tue, 31 Oct 2023 01:04:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxdBL-004LJv-2P
	for ath12k@lists.infradead.org;
	Tue, 31 Oct 2023 01:04:37 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39V0xGdU005132;
	Tue, 31 Oct 2023 01:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=SQZW/CdP3HahVXaQyVTGHV6T287TqandADwzF8Sf/oA=;
 b=G+C7EioIwFGZv4FycIp9kZAhsNNweIGNqQ43H2LF9SpWosHzSMdQxTJm2XRan+50ELzc
 UqvaeeoI6xOnN5DBhh+z4i3w1vgEh9uhaItGV/Ds/uJ5lE6ysUBq/HP5+qlDdpFwzSaV
 DX/n8LfvC/zGI8VdoLw7GVvUJZvfwaC8i+55NaMzjwpJFJctX7LCuTdIW9WSrR5KBTdh
 PNkzADDCfVoJ/DiPl09JbNhWsITIFm3hcuYDly+PQy5SIDv0jze3FjkcJsFBbpng3RgE
 FF9lRet9xpH/u9nYPVC+qh+1WbOqp/Sf49DpRMthz6VAV+ZoNiS1WeBuadsR4hSIJ14f tw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u0sw7was7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Oct 2023 01:04:34 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39V14XpS018245
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Oct 2023 01:04:33 GMT
Received: from [10.48.245.206] (10.49.16.6) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 30 Oct
 2023 18:04:33 -0700
Message-ID: <eaa58dd0-dc90-476f-83df-ea9437e04ab0@quicinc.com>
Date: Mon, 30 Oct 2023 18:04:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] wifi: ath12k: fix PCI read and write
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
References: <20231030222700.18914-1-quic_rajkbhag@quicinc.com>
 <20231030222700.18914-13-quic_rajkbhag@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231030222700.18914-13-quic_rajkbhag@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Nhrejt3Mvb7I1FYKtD7trhharKvf5yKm
X-Proofpoint-GUID: Nhrejt3Mvb7I1FYKtD7trhharKvf5yKm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_13,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=774 clxscore=1015
 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310310007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_180435_900643_92BCC6D1 
X-CRM114-Status: GOOD (  11.59  )
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

On 10/30/2023 3:26 PM, Raj Kumar Bhagat wrote:
> From: P Praneesh <quic_ppranees@quicinc.com>
> 
> Currently, PCI read is failing for the registers belonging to
> SECURITY_CONTROL_WLAN registers. These registers read is required
> to read the board-id to identify the dual-mac QCN9274 hardware.
> 
> The failure is because, for these registers (SECURITY_CONTROL_WLAN)
> offset, ath12k_pci_get_window_start() returns window_start as 0. Due
> to this PCI read is done without PCI select window and with
> window_start offset as 0.
> 
> Hence, fix PCI read and write by doing PCI select window and by using
> the correct window_start offset - WINDOW_START for
> SECURITY_CONTROL_WLAN registers.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Co-developed-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
