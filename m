Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043D9C4332F
	for <ath12k@archiver.kernel.org>; Mon, 30 Oct 2023 23:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IkFVVd1zK+JjbWRZ+3bat/cJlb9Y3EOPgRT3uq6DxBs=; b=n9I0qEI6J2XSWA
	eJHI14p7aOHW5f/sfoRplJru+8aKgESmXIgdrIjTL85dlHjGRJeoq4Rd6BwDtxVuKOe6l7KuK1TN/
	26YQVFSLP59KAJZqrjab4I7a6cGXVcbz6QiVzLeqOnVlRo4aMpFr5A/c/gXjHllsVNCJdMRh4flLr
	ODL7Etrr8iELq1ktyb91aedPJYWqdz3XsGl1NkPLDIEwJdcKrbqZDtfb5EHsKS+ztjCuiUXBTc77a
	aZ/vYcQk60r1EMvT56dc7UdVFQAStgHHbpyDt6Ryhs7K8P4QiW6J+bnCArtmnsaiJR7Zz14ghmsFF
	clL3kEidZ+hY0ArjAa7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxbfE-004CN7-2Q
	for ath12k@archiver.kernel.org;
	Mon, 30 Oct 2023 23:27:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxbfB-004CMd-2j
	for ath12k@lists.infradead.org;
	Mon, 30 Oct 2023 23:27:19 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39UNLmCo023598;
	Mon, 30 Oct 2023 23:27:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=41jd054tMAEs5554kFCbhwolD8WHBLktf5FQAE1o/P8=;
 b=C3GZhexUSxBRroKVVW3illVc61cZPuJSGOMyh/Fd/bTCtyg2WD9FiY8UTdUiL6fZxKMu
 UJr7IP/UuN72MvKG803tQcAUuC8KNYuEVYTh7wqeOM7E2icY6sMqTiq1Rl4scbNQi7zK
 I7svyVJxE4VLOhH4JzuqSshZxWdm6NyGhpTwTqjX8e/GrekBzVAAyARJB6utIYcyJawT
 e5CuX9Es7U+r4VKT1keRj6noSDCiupCdlU773TgZ2HMrxEDg39RlneCM0DjpTR7YSfG+
 KYa/u/J318gAuFNw7Ft9gCP8qqsVrXOTSYVQFQXtJiMw5cRGb25EwjekLA46JuU6jNWR SA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u280jt1xh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Oct 2023 23:27:17 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39UNRGfl001827
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Oct 2023 23:27:16 GMT
Received: from [10.48.245.206] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 30 Oct
 2023 16:27:16 -0700
Message-ID: <d9663937-a4cd-4440-a9e2-f3365f1805a6@quicinc.com>
Date: Mon, 30 Oct 2023 16:27:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] wifi: ath12k: fix firmware assert during insmod in
 memory segment mode
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aaradhana Sahu
	<quic_aarasahu@quicinc.com>
References: <20231030222700.18914-1-quic_rajkbhag@quicinc.com>
 <20231030222700.18914-8-quic_rajkbhag@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231030222700.18914-8-quic_rajkbhag@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JNHAMg839pNOtHJQ1EI9_8kqIQyssdyq
X-Proofpoint-ORIG-GUID: JNHAMg839pNOtHJQ1EI9_8kqIQyssdyq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_13,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310300183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_162717_887305_47AD202D 
X-CRM114-Status: GOOD (  14.19  )
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
> From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
> 
> In segment memory mode, firmware allocates memory segments of size
> 2 MB. This 2 MB memory is used by firmware for the number of peers.
> This number of peer is sent from host to firmware during WMI init
> command. For single-phy the number of peers sent is
> TARGET_NUM_PEERS_SINGLE = 529 (512 + 17). While for split-phy number
> of peers sent to firmware is TARGET_NUM_PEERS_DBS = 2 *(512 + 17) =
> 1058. With this 1058 number of peers firmware is unable to allocate
> memory in 2 MB segment and firmware crash is observed.
> 
> Hence, fix this firmware crash by reducing the number of stations
> TARGET_NUM_STATIONS for split-phy.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
> Co-developed-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
