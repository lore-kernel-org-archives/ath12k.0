Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF5EC67861
	for <ath12k@archiver.kernel.org>; Mon,  8 Apr 2024 22:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q1xjPnwoxxLm+hY+vcfsQYj8ICVNKy3zUEywdLZT8K8=; b=N6tLQbBbfNxsbYqYQiNvDVpw8Q
	Kzx5tEI5cI2/qsXOoX3VnBRcgxMvMNw0r+VH3vS/i1K6QZsY/BhmYw895r+cnsgIOkoR6ZeMvUAAD
	OAkaCA0ma971+caUl9LKi8jSjFE4AXth8c5clJ1gj8JcCF9StGdQXoR0B8eTVdTb3akwHWO8bv0De
	B9PdrKdlvgpVVLWgsYAC6WSDDdPVoN6p/cqY3gTawY0f1OQuYL+PN6mdcKFwrgl29c2i5ewkSUAO7
	WiZk/2qwjsdd+atWpd2IUTLtla0y6WtMgKE9BkvN/GCAgoO+U21ngEJoI5j3LT3pXwoyWUsINAGCq
	MuMDLxTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtxIu-0000000H0FE-3zFq
	for ath12k@archiver.kernel.org;
	Mon, 08 Apr 2024 22:17:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtxIr-0000000H0E6-2SGQ
	for ath12k@lists.infradead.org;
	Mon, 08 Apr 2024 22:17:27 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 438M9xhS003684;
	Mon, 8 Apr 2024 22:17:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Q1xjPnwoxxLm+hY+vcfsQYj8ICVNKy3zUEywdLZT8K8=; b=XL
	0k2R9q86uTeZ5IYy5ZpI5++iKnKTlrm61DVXho5fQwQFlpf+RuXFASsz93/OIbCa
	9kvsSJBIwY13BRBqh2XuuZ2U8Fp24gLXviAwELxXGiYSstzcxELxenLMHmy27Soj
	QdyHq00xe5CKM31PlFjK3eA3ARnXENuEU/eMZfEfisN8drVKbY1rzDzkxjnPU8jX
	uM9Qok0k68Pq4XMyQ4JW+WedIiJuE93cPxUIwzQ2WF/Wy3HHjToxgBB9MdPzf29r
	83rpnWKznyXXw0NTV6B3UVtgOjBNYKaEL430PCgFIP0BFeUUVpuZHkQeQ1/+I725
	MKD6VIRIeHTL2YUj34IA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xcbfyhymw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 22:17:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 438MHNcC008813
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Apr 2024 22:17:23 GMT
Received: from [10.110.80.194] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Apr 2024
 15:17:23 -0700
Message-ID: <571f5a84-f7ae-449c-9670-8574da28da79@quicinc.com>
Date: Mon, 8 Apr 2024 15:17:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] wifi: ath12k: avoid redundant code in Rx cookie
 conversion init
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240408040547.837639-1-quic_periyasa@quicinc.com>
 <20240408040547.837639-2-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240408040547.837639-2-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hg2PeXEHahy2D8-Z6KY1CoNwG0pM7x6j
X-Proofpoint-GUID: hg2PeXEHahy2D8-Z6KY1CoNwG0pM7x6j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_17,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 mlxlogscore=699
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404080170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_151725_965313_991D52D6 
X-CRM114-Status: UNSURE (   7.22  )
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

On 4/7/2024 9:05 PM, Karthikeyan Periyasamy wrote:
> Currently, in the Rx data path cookie conversion initialization procedure,
> the primary page table index (ppt_idx) is computed within the secondary
> page table iteration. However this is invariant, and hence the ppt_idx
> should be calculated outside of the iteration to avoid repeated execution
> of the statement.
> 
> Found in code review.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


