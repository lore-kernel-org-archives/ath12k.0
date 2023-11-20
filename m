Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADE3C2BB3F
	for <ath12k@archiver.kernel.org>; Mon, 20 Nov 2023 15:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ca9IBtHfqjiTcx1/eOnJjRCIQj8NMTX+A2+7T8/NJhY=; b=TzAIN3dFnyyNWt
	yl9CVyPI41BWTJ+IultoqHTfCN9BOu2GNDjnprk8etKnaNWxqK3bksNG+529kDTaQ+mFQbvr8mZ60
	7qv+QNtMXQHMK/hiD4hsYNOIMYf8Oo1A/VZaJwz3BAoWkOFyMMF6t1cqiaJh5lN9BzZsyFQM0vj6u
	LolelBLe91dNt3WRWqb501zyp8cT/5SpwxYzSJghZwb2LrxvoD+E279UST5kc7mBDtOUyNk3v8bMr
	eFlQyUkaF98km6tmjTObaxxOuoaaKXveG1Dope4zrHbdls7vBnwb7lAQp9yD4W9QPb0cJ7QvjndQu
	oe6q8TtzuI4+U1/H88/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r56bW-00CuR1-0K
	for ath12k@archiver.kernel.org;
	Mon, 20 Nov 2023 15:54:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r56bT-00CuP2-25
	for ath12k@lists.infradead.org;
	Mon, 20 Nov 2023 15:54:28 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AKBDatH030911;
	Mon, 20 Nov 2023 15:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=4bd0XRe4FCwWZRIDjVvl8uD5OUgY+a0/D7Aa0HY1R1c=;
 b=PIdYeLte7DstmGy1+5p6oshebbpDm1Ks8AkwNwOoJVrTxIR4h6I5oIvlE6c510wX5WgP
 YXo1iQchsfRnj+dcZ4SgGcMohgdgglDMWUq3w4/iFsHnmYoaHPWw8wj9YWa0jVEptfqy
 UHlnJwzkbeG8gkGzKgmEoP1EzJ61PiWtdttvm3PLbDIRtAJAdUyI42ZV8ZOUqngGKx0T
 WJaDdSEcIy5XXXd4rTtnHmrXNGA7jyc5DRqrzPVR4ZwVLoxKkFDehv9c0mtJLwfG7LQJ
 3yW8S2eFDcnt2wigaUyCeNchqe3uyp/xz2cwn66DAX1+9aHNNf2t/mTAmQyYGZcQZaEz Vw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uepjhma5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 15:54:27 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AKFs1FN001416
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 15:54:01 GMT
Received: from [10.110.116.223] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 20 Nov
 2023 07:54:00 -0800
Message-ID: <05f2ec30-07ed-46ca-958e-b3f5e3a18ea9@quicinc.com>
Date: Mon, 20 Nov 2023 07:54:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] wifi: ath12k: do not restore ASPM in case of single
 MSI vector
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231120101543.4369-1-quic_kangyang@quicinc.com>
 <20231120101543.4369-7-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231120101543.4369-7-quic_kangyang@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: q4kzSwsbvGHkFb5QD0AoxPDxj5qHAxI2
X-Proofpoint-GUID: q4kzSwsbvGHkFb5QD0AoxPDxj5qHAxI2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_16,2023-11-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 mlxlogscore=809 clxscore=1015 suspectscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311200112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_075427_700861_20864480 
X-CRM114-Status: GOOD (  11.90  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 11/20/2023 2:15 AM, Kang Yang wrote:
> Current code enables ASPM by default, it allows MHI to enter M2 state.
> In case of one MSI vector, system hang is observed if ath12k does MHI
> register reading in this state.
> 
> The workaround here is to prevent MHI from entering M2 state, this can
> be done by disabling ASPM if only one MSI vector is used. When using 32
> vectors ASPM is enabled as before.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
