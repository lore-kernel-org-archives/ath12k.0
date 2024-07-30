Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120C7C3DA70
	for <ath12k@archiver.kernel.org>; Tue, 30 Jul 2024 16:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FouOIq3uzOBBbDI6uQ5oB+9PtLAeVTTorN0UvseMqIY=; b=im1MaIhaDdp5TnKlu7XgwcrthP
	y7QIPuWq8Xr85J+CWBk8iEPrF5k8wDhEYJA1YH841SQYP/2mNIwynvYxz4SdjpT44sc+v16+0p+9H
	6VblhX8pDE3gjKiWu3HrS5Gdxi94IZF41tKiw2DzHliuEAJw+ho8bc2LZJqmRzGyS823CnsszBfm/
	FUTgJucix2TLaYpyUGF+Z0NZ9JnplFfipbO/mdxrjyo2cpDXPjewzFq8jcYv9QhS7rY5SeE640FYj
	W8vKn9zUisswZcegt3ssn11wBOpcyGGzldD2UCF5gGe4UWjVNhiNE0D2HOBIlJ7WWobgPBWHwCYuj
	FWySvp9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYpmh-0000000Fsf6-3LFN
	for ath12k@archiver.kernel.org;
	Tue, 30 Jul 2024 16:33:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYpmT-0000000Fsct-1m6q
	for ath12k@lists.infradead.org;
	Tue, 30 Jul 2024 16:32:59 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46U9RKYv031664;
	Tue, 30 Jul 2024 16:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FouOIq3uzOBBbDI6uQ5oB+9PtLAeVTTorN0UvseMqIY=; b=Z2JCE9FVeydMKla4
	T/XFH8c3pLm2eRONzSgxupSa7Zgsnqb84LQy0QqWMA8M153qA3YCDJVlrbjnz+rn
	ZGuO0v4G0gBlbL5oTiPsBElH0nkeX/mZDD+OrI1mPj90OA5OMrv5nyZ1iTJW81es
	vKcgfJjGOgG5oac+kaAJrOsP9/a7bdmzzk6QmY9ZODH228A8uHwPDjbSk7BxfJiM
	ghqaWvGMgzmJ6iMgBMH0cLRxbgrPhm7YFf4jGg55bvmC1cyuaX7ByqzRnRQ/PnLR
	WJ/7wgOlPTCOPUWOHMuvxk97jOsNT5u2u+ecYOlyjGKNv1uLuZwWA44eGyWL0Zvf
	x+vCEg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40ms96rahy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 16:32:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46UGWsJE010641
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 16:32:54 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 30 Jul
 2024 09:32:54 -0700
Message-ID: <069529b8-d4cf-4e4b-8474-06115ba7824c@quicinc.com>
Date: Tue, 30 Jul 2024 09:32:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Modify print_array_to_buf() to support
 arrays with 1-based semantics
Content-Language: en-US
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240730035154.3723773-1-quic_rdevanat@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240730035154.3723773-1-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: caSxLkiW8R1wCEWbNfp4HoxYQM9p-Fvv
X-Proofpoint-GUID: caSxLkiW8R1wCEWbNfp4HoxYQM9p-Fvv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_13,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=718 bulkscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 spamscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407300112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_093257_632650_F686DA36 
X-CRM114-Status: GOOD (  11.21  )
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

On 7/29/2024 8:51 PM, Roopni Devanathan wrote:
> The API print_array_to_buf() currently supports printing
> arrays with 0 indexing. In some cases, a few arrays need
> to be printed with 1-based indexing, i.e., array should be
> printed, starting with 1.
> 
> Add a new version of print_array_to_buf(), named
> print_array_to_buf_v2(), which implements the functionality
> of print_array_to_buf(), but with an extra variable,
> pointing to the index starting with which the array should
> be printed. Modify print_array_to_buf() to call
> print_array_to_buf_v2() with 0 as the starting index.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


