Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3490C47077
	for <ath12k@archiver.kernel.org>; Thu, 11 Jan 2024 20:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xuvU9OdVmFQkAR7+CCgauccQopf+Rhe3Wn2k09eYFx4=; b=qj72M2MBfHKH4FfU3cOKZPYjf7
	MIqFo6ssZfslQ1YrOGjOF59vwmShLvcpIqtgL6sbDrbHRfm35bql1RPk16nMYY8l/1F1DPXJvWV+1
	8PNceJO5eH+2avuMg63//qUsi+02iv9QA2Xj72vfLg33KvuBrTpjh8NxUyMfjDM1OzjOtaUjGAEuJ
	rHq9OpKYfQf31I7ConhNwZv8x6W3CbRI0ntSI6pJbmoEFniBrq3dJNB9nEK0npUSRBmd0JQUYnd7Z
	lcNljBqFFOh5vjkaAbvDKnXBq+u8Z2G4viyzVNdyRlBVP/sl5wNdbRWqNZ0gn/DK4gOyZLR71VFo+
	RBfJeojw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rO1TF-0014im-23
	for ath12k@archiver.kernel.org;
	Thu, 11 Jan 2024 20:16:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rO1TC-0014iS-0O
	for ath12k@lists.infradead.org;
	Thu, 11 Jan 2024 20:16:07 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40BEx48j002203;
	Thu, 11 Jan 2024 20:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=xuvU9OdVmFQkAR7+CCgauccQopf+Rhe3Wn2k09eYFx4=; b=lg
	0pZvngAq5CjtQTCarYN/YuUUmPFPeowutGICyv4U8Dd1mnCfm3FdKLPU9teOJFH6
	V85St8HUq0TlC+IIvIPQbuzxvdKdQOMHK3XZxvtSTobroAJBEZNolMFxVRWzEhZc
	ynySbktD/4XJMNYAfJDr9oGikosT8w+byjb4pMEbTp+BKYdxhaS6Lg1IIfl5otN1
	P8IblR8+iBOLxLPn6LmZ9g5cKfVWEEUXEilaD0wj6UFfVmMQfqERKmA9le1jqRAB
	+evxdxS3xv1zV4aDTbzl7KCzr9vfWWaX4jvoGuSFAv62jKJ59TBH7v1j2VPmZiA3
	xQISikQWAeN5zLay9dhQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vjcsk1pp5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 20:16:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40BKG4F4006363
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 20:16:04 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 11 Jan
 2024 12:16:03 -0800
Message-ID: <f1431217-447e-4d1e-a97c-e5cea6ff2c36@quicinc.com>
Date: Thu, 11 Jan 2024 12:16:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] wifi: ath12k: Add single wiphy support
Content-Language: en-US
To: Sriram R <quic_srirrama@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240111045045.28377-1-quic_srirrama@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240111045045.28377-1-quic_srirrama@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ljA8xZXW_DwTuokbIr3LxQpghNOEpFvb
X-Proofpoint-GUID: ljA8xZXW_DwTuokbIr3LxQpghNOEpFvb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 mlxlogscore=608 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401110157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_121606_279576_0DA35F1C 
X-CRM114-Status: UNSURE (   6.42  )
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

On 1/10/2024 8:50 PM, Sriram R wrote:
> This patchset is dependent on "[PATCH 0/2] wifi: ath12k: Introduce hw abstraction"

I'm currently unable to apply the prerequisite patches to my workspace,
so I won't be able to review your patches until that is resolved.

/jeff

