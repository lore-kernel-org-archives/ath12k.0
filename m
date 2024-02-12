Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACA2C4829E
	for <ath12k@archiver.kernel.org>; Mon, 12 Feb 2024 18:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNLFPIB0kip7haSFEstgqeTp9AVQBoSxPW72xcS7JU8=; b=QTuwREMBjf81boE5fG2Ou55Au7
	IfUEONUQ01nk/Aj1vZgEfUekoIBb0hTJV+D2oU6LQK7fPZk7Lu2gyKbxtCA43caNv609J9AQbQXjy
	IeM/jq6NUymkOwF0+rMuJz+GND0u4zvIhYZ85Y07+T9DgWLg9k6Ih2XIG4K6L9YLkWmBgydQAxQiK
	FeduT6UtC3/lJi7JXCqw7IwxUNpNIgkboFvvINDQHtVQ0w4bjfCa6AB1C4ZXhFmnEDk8JSakFYUrI
	JYWMG/jhRp5h0ujVyIBYQUpnrsEHa7olPqs/5eOEC0oJukAjFkS4Tgiy4tsd2JpooT+nXCHh3Mcox
	Q8rwKKuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZbOm-00000006gVt-0qWy
	for ath12k@archiver.kernel.org;
	Mon, 12 Feb 2024 18:51:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZbOU-00000006gUA-38xc
	for ath12k@lists.infradead.org;
	Mon, 12 Feb 2024 18:51:09 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41CGT8QR003794;
	Mon, 12 Feb 2024 18:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=iNLFPIB0kip7haSFEstgqeTp9AVQBoSxPW72xcS7JU8=; b=j3
	zYjbvxk93YW7oia3NXnsJU5DEZUSg4VioZuoqSxW01tLQRkjCvOabSq+bQsNK3L5
	ux04UzPmQOdTaSZa25OVUlsxOrmFswqZcHwkAY5+fnGUL02vvk+q9E5o4aZ0Igiv
	XxhgiHFAb27Hr3StSU+KZjDzQnHELy+Iv+mNMa0Y/XZxAXzDS2gxihcAN4WFdkP7
	N33WjUEUatkvyNuuldefMHh4PtXIh2vM5qjrxu0LpfKy1nTrP/zJorOyQNUbMh8s
	ZTOSDzak+pgB/yRVAP3O0F7DvIq7YXxJiTBkfXeR8U9hwYyqtQWhQc/QfHIm681L
	jcuBZ8YW6eWt5xvK+ZZA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w7gs1h8tv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 18:51:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41CIp1Kl029814
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 18:51:01 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 12 Feb
 2024 10:51:00 -0800
Message-ID: <51e12308-4e5c-4f22-9288-d3efb3c81d64@quicinc.com>
Date: Mon, 12 Feb 2024 10:51:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: remove the unused scan_events from
 ath12k_wmi_scan_req_arg
Content-Language: en-US
To: Nicolas Escande <nico.escande@gmail.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240211151104.1951418-1-nico.escande@gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240211151104.1951418-1-nico.escande@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZssOdssODhGdPW9pF2lLGcUbf4XgBDzy
X-Proofpoint-ORIG-GUID: ZssOdssODhGdPW9pF2lLGcUbf4XgBDzy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_16,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=688
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0 mlxscore=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402120144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_105108_020378_B7CA99CF 
X-CRM114-Status: UNSURE (   6.34  )
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

On 2/11/2024 7:11 AM, Nicolas Escande wrote:
> As done for ath11k, lets keep on cleaning up struct ath12k_wmi_scan_req_arg by
> removing the unused scan_events. Also remove the underlying union & struct
> construct as it isn't needed anymore. No functionnal changes.
> 
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


