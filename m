Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3E9C67861
	for <ath12k@archiver.kernel.org>; Fri,  5 Apr 2024 15:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hIvaDDBe4T71c84HBV+HAl/sAOvFVjIISX4mFQoPsv0=; b=D6CYcCTyPv+m65HFI5ZFAJ7jFw
	Y3YycYPxtYgstH+IpIimxEnU9mG+S2+j3KF+Ji3dawNBPX09y76VWb1pF8yfTOQD+qE3oPPtvFvjW
	8XnPyzzqgxIeli6pAvJAikYGH0ybBCWduhb4UC1NxKYFEXGUFKsZ/Ad90GPhduD3gUIBADFGZrsR/
	xmxS4dLFXWHX8YEhxo3x4VvM7mfdNyUQrtSCucFV0aBHvpZ+lXfuzGugSQ5PqPSlmLiillBjRKJJZ
	9fWR6d0sOZtu8+HSP85WJOJJ5Eb59LkSj/4NgOmYI2uWdKTgdBxdtMxlhUl+BT+XQ51Jg439eCAqk
	IjZgXxZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rslcx-00000007nCH-2voK
	for ath12k@archiver.kernel.org;
	Fri, 05 Apr 2024 15:37:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rslcu-00000007nAo-38N6
	for ath12k@lists.infradead.org;
	Fri, 05 Apr 2024 15:37:14 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 435CMjVe004415;
	Fri, 5 Apr 2024 15:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=hIvaDDBe4T71c84HBV+HAl/sAOvFVjIISX4mFQoPsv0=; b=ZO
	r7K0bJ/Cru0HOWtJDxqzHy/ITN0NdGdnsHoFQMvUkL9bACeXMbitg9zJRFb9F4x1
	kOUqyUei+mIJ3jY03gHn1qGZWGCTCgrGOXIkdlUy5zETXC5rCH21pw/frox9lOMy
	cyh8vS0kxz/OWcRAeasC0FeAS2dPADmuq6I2fWYU+llCOhZCkKuFjLZPk9lejUwo
	3s5VoXwjyG7isAePT7Y7/XFoTf00MZn4bwTgPuWxX01NtZbYc81I0aN2BRd5d0iE
	b1EsqnlWVmZWCD+OGpQEcMohnQQTeXI+AMO5jc+896mfG/Ls1Y0eYAf3rVJzKN5y
	eDFXuxh/mCmJRXBRzRgg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xad7h0yt5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Apr 2024 15:37:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 435FbAb6029145
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Apr 2024 15:37:10 GMT
Received: from [10.110.127.230] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 5 Apr 2024
 08:37:10 -0700
Message-ID: <9a740e75-9a4e-4f1f-8e34-529f19835e77@quicinc.com>
Date: Fri, 5 Apr 2024 08:37:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: correct the capital word typo
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240405144524.1157122-1-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240405144524.1157122-1-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CoiyUbHWbPLPiBccN9Ze4Q1eRrtVc45m
X-Proofpoint-ORIG-GUID: CoiyUbHWbPLPiBccN9Ze4Q1eRrtVc45m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_16,2024-04-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 mlxlogscore=681 clxscore=1015 mlxscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404050112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_083712_972122_8EB4E660 
X-CRM114-Status: UNSURE (   6.07  )
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

On 4/5/2024 7:45 AM, Karthikeyan Periyasamy wrote:
> Rename the "ATH12k" word to "ATH12K" for consistent capitalization in the
> word.
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


