Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA447C61D97
	for <ath12k@archiver.kernel.org>; Wed, 22 Nov 2023 16:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/amk82XBpE1g+IArBnhseUcU8WJD66cbBxNIf/Q4s88=; b=0/xqNcP28CY5pv
	vF34DMQlmwuX2VtTLEIP8AwWmf7qBJqfZLBvRX7OqyTC2ipmZkRRijfr2CmbxVQ4dkEHnxI6/AMwB
	CmPZKNgCPTvuHFtiCCv1SglXALFQP+zBVwQgtlZyVTyb8tYovZOOiL6oN7nQnGCT96SvUFMUv6qCF
	XRGbqrIhcQAngk1mAfggVqqFY/fSJAVHnAIMhvyIUxZxwnd9COzf2LLDraJEx+3ZFn+dDqseobBWQ
	FOOItIz+iMUTrQa8pblXJzV2Gx0dc1HrXlC/owMwfoYku1L7Eq142xlH1QnSIajgmaFfklMajN8Q9
	cgI1r2Wzx7Hx0WbsoeRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5q9n-002UAf-1a
	for ath12k@archiver.kernel.org;
	Wed, 22 Nov 2023 16:32:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5q9k-002U8s-2I
	for ath12k@lists.infradead.org;
	Wed, 22 Nov 2023 16:32:54 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AMEWDUV007002;
	Wed, 22 Nov 2023 16:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=oDgn/65ZtBXpKc5GLMisfJxYqFdfBUG2VWognm7cKjQ=;
 b=F5vdTe3vbMyOc45iJTTcmHWmgKFHiFRaTMLc8uGg2pkgThuOM0d5ce1p79+lFqslNAOU
 InNokkVhRT/sO97wbaQ9wlhoT8+Q/OI5OWEAgZXRInTCtwIzqhm4EXNBZtGdnWLi4kz5
 FXrpIKEft20mogF+2Hg/mhazyYlC1sudQIUFez8Wue80o/bMkG03kaGK6Sw9x/9MHkN1
 ufq3FRAl4bAiJs3JHeBNAFDiM/oN0eYPNw2vtLtbRi4aZP2WTXzrz0XcPSHDcLVWUFcm
 6Y9yw0LsUP/xNzUXseu/U+0LS0Bcz+MMwFIDfMuxD97gRSFPfabILRXYyco89Id4QIdS JQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uhkfnrag4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 16:32:49 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AMGWmqf003112
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 16:32:48 GMT
Received: from [10.110.116.223] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 22 Nov
 2023 08:32:47 -0800
Message-ID: <63eae2f5-4f92-4384-a0b7-e6dc03032263@quicinc.com>
Date: Wed, 22 Nov 2023 08:32:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] wifi: ath12k: Remove unused tcl_*_ring configuration
Content-Language: en-US
To: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231122063932.10321-1-quic_tamizhr@quicinc.com>
 <20231122063932.10321-4-quic_tamizhr@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231122063932.10321-4-quic_tamizhr@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QBft-ftrbHIc4Tg8vAe1gPQrJpCjMVOK
X-Proofpoint-ORIG-GUID: QBft-ftrbHIc4Tg8vAe1gPQrJpCjMVOK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_12,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 mlxscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=845
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311220119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_083252_863810_53FE5716 
X-CRM114-Status: GOOD (  10.86  )
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

On 11/21/2023 10:39 PM, Tamizh Chelvam Raja wrote:
> Currently memory allocation for multiple hardware rings
> done in host as these memory will be used by firmware/hardware.
> But in case of tcl_cmd_ring and tcl_status_ring neither firmware
> nor hardware uses host allocated memory and it uses memory allocated
> by firmware itself. So avoid tcl_cmd_ring and tcl_status_ring setup
> in host.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
