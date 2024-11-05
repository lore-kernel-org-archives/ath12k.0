Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01FFD3E77C
	for <ath12k@archiver.kernel.org>; Tue,  5 Nov 2024 22:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a3J0PIt5pq2GhBnyR9HHq7iYvJCEuAQ7GudunJETv9E=; b=MZaC86YtdomIphdJRtn/GIGWiX
	l4origENNDXawBDCjMRvCnJRsQGc/tTmmQcAZx6draSAEbE6bkOp4lCdvC7PtczzdW2rIgMPQ1VXd
	YjkdF/7gtbYokbsQP1w3MgGM3sWABx585ZE8WN+n2daqI1lsWDpvjVy5Ph4OwsD230Qx0viI4nM3Q
	TiXB+WGe2d6XziEI1PH/ynKA1AL3uSJrJuQq6CpskU4zd+GFpWEdqaDfstwNj0R1bhATcHp8wZtt2
	6/PPqljxbyB0Ch30EVNy3XQ3DLqe9l6sf2FA5U7FHROIFAl1r56itRnJqgIt6LSmfzkIpiZFkEOcw
	Lre7gVeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8SMo-000000012ne-2Kmn
	for ath12k@archiver.kernel.org;
	Tue, 05 Nov 2024 22:49:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8SMP-000000012ky-0f1z
	for ath12k@lists.infradead.org;
	Tue, 05 Nov 2024 22:49:18 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5KpQCJ004167;
	Tue, 5 Nov 2024 22:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a3J0PIt5pq2GhBnyR9HHq7iYvJCEuAQ7GudunJETv9E=; b=jh/nIKJm27hUhmux
	4A+cgtIxdT5bJ/IX+E9dAa3a+9gzyqwX2MmcplTMo1zspMhYuPOZjg9Fx/j8SkqD
	jIXZ4buMtgmPxcka4Mm+B9HIL6wzlCMTpZ1mt7FwdyDEB5aGdo9yEy6IuhHIFrwz
	ACLPZkFveBx8w/ZdBW2SPJsLWot1RDfzHr41ZcUDUI07bGJepPNZ2JaIKu17jobl
	YPTwhaXwbFPI+CF+KZtWFFJXFTZ5IhZmZAvWAnBkpMFFYnT+YmCjxuo7xd9DaaQb
	rdYgR+iY0q5JZXVuRo4JxYL75EkVSLarce5hPIh3FJWpnGu6jZ46ZUGaswwEJhnS
	U7wNzw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qhbu9y9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 22:49:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A5MnE4N018306
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 22:49:14 GMT
Received: from [10.48.242.250] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 5 Nov 2024
 14:49:13 -0800
Message-ID: <b9f31bb7-7bd9-4f37-a475-7a1777afb73c@quicinc.com>
Date: Tue, 5 Nov 2024 14:49:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] wifi: ath12k: Support phy counter and TPC stats
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Dinesh Karthikeyan
	<quic_dinek@quicinc.com>
References: <20241105045406.2098436-1-quic_rdevanat@quicinc.com>
 <20241105045406.2098436-3-quic_rdevanat@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241105045406.2098436-3-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WIvsEI3DtLo7PzocCVgqig9D-x2l163g
X-Proofpoint-GUID: WIvsEI3DtLo7PzocCVgqig9D-x2l163g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=976 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_144917_379588_4045B700 
X-CRM114-Status: UNSURE (   8.29  )
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

On 11/4/2024 8:54 PM, Roopni Devanathan wrote:
> From: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> 
> Add support to request counters and Transmission Power Control
> (TPC) stats through HTT stats type 37. These stats give
> information about counters like received packet count, CRC pass
> count, error count, transmit abort count, etc., about counter reset
> like reset cause, channel frequency, number and mode, channel flags,
> etc., about TPC like transmit power scale, maximum transmit power,
> gain cap, EIRP, etc.
> 
> Note: MCC firmware version -
> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4 does not
> support HTT stats type 37, i.e., the firmware does not respond to the
> event requesting stats.

nit:s/event/command/


