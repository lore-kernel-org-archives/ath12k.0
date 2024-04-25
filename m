Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4707C4345F
	for <ath12k@archiver.kernel.org>; Thu, 25 Apr 2024 22:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+lfbwEZM3ssJfOh4OMA1NbCsaUXgG8uGXAIyMyNe9AM=; b=J5Cp8lyqbtiNE7UN2Va3DZ9G+x
	w7u7QYw/hlYQ8nEXeIxRx+L4hdZPIERwuArTkJYuQLckMxS2Fh+bWFlgFg+27bHywIkmcCm0HXRYh
	zn2OSgSV9qz+OPSRv0Slg9DbEmBjoNahwujI8YlV1zLHjAqyZijkyArWXaGIQFFajBMhQkRZ+3yxh
	YTGcAHQuj66oFPONnm1B94jQ6NnJ0ltryg+UyaT1T3rq2AONZJKsAhUf3GyiUUeIqBNvmNA9dVJTD
	UatBJAFMV0G4BwEGvrnFOYfWx4x6MX49zk3YeoSn+d0jfltqI34g+6QraKhWQxWt1f7qHns+4ovXA
	YMMvggJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s07rk-0000000AWDy-1TEp
	for ath12k@archiver.kernel.org;
	Thu, 25 Apr 2024 22:46:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s07rg-0000000AWDL-1tMd
	for ath12k@lists.infradead.org;
	Thu, 25 Apr 2024 22:46:54 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43PMZCHB010738;
	Thu, 25 Apr 2024 22:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=+lfbwEZM3ssJfOh4OMA1NbCsaUXgG8uGXAIyMyNe9AM=; b=gi
	q73Pi6c1fV8FRjWt8BIpZ7pkLtv0SZZqbpET+esAh8chMfx531NMEMskNpk8GzVa
	0FyU1kn3GHl8z3JkYrFcP0JrMtYHoGxBp/0IbbDk0CuP3rZIenzLwYdDx1Updav/
	j5lYWLEzhXPt0+2SMqPtAD6n1YdN+DVglpjlFaqhHGeB0PzIzn92HPB4yktg3IHd
	h8boHopIjNogNEQrm++2jSbenxomBgglxMOnc5J/T9M7dEFxeIcL7m8ppA0+ACQA
	sSZlnxo7YGt53OnwTuBrbg7JhTWy1Me4SRg/2oDSefzocf9pK3zGMeZGxFzBBEnZ
	VzTBDfykk2Fs5Uet3RhA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqenhuwck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 22:46:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43PMkoI2012380
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 22:46:50 GMT
Received: from [10.110.19.58] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 25 Apr
 2024 15:46:50 -0700
Message-ID: <026f333f-5f8d-43cd-bbcd-d55dcae0e976@quicinc.com>
Date: Thu, 25 Apr 2024 15:46:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/10] wifi: ath12k: push EHT MU-MIMO params from
 hostapd to hardware
Content-Language: en-US
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Muna Sinada <quic_msinada@quicinc.com>
References: <20240424201959.935-1-quic_pradeepc@quicinc.com>
 <20240424201959.935-4-quic_pradeepc@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240424201959.935-4-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nP87kKwpdd6jvJr4P13FAHNyVhtOTHu3
X-Proofpoint-GUID: nP87kKwpdd6jvJr4P13FAHNyVhtOTHu3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_21,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 mlxlogscore=599 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404250167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_154652_581898_22DDC03A 
X-CRM114-Status: UNSURE (   5.79  )
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

A couple of your patches, including this one, have subjects that refer to
hostapd. The driver should operate agnostic of the userpace entities that are
managing it, so please avoid referring to a specific userspace entity.

Describe the problem in terms of the operation being performed, not the entity
that is initiating the operation.


