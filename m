Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D67C44512
	for <ath12k@archiver.kernel.org>; Mon, 20 Jul 2026 02:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WwYCea8We6mdjWm+dC6kPkTmaclY2KKsawC/nEua+YM=; b=3+WtkPW+5GYVRxgc0JdBOo+bvw
	tvyz9AddQ0WFJQ7gv7nhRFjq0wTgr2fNlH8XITTB5BLvasGaIOJVWYpTshfpeRlfSBJZDYqnc/eJ7
	wj8NdLgVrC/UEsC6UK+Vf3X2jpa8UJicBb4MNXGt2PEbh91L465+2DGYQAOGIG6WrWNh8GQoT5uKR
	8VciEHIhF6SABlAIpeLPTJZqc6j943zrWoEtirm43JQSo7RQ94pr+LsKrpWlkX5JTrIpa4MCn2Fmq
	UtvXMUZDwoXpNEVk499uiy5Sr9b6mJAz566kj9zlhJ7ubOVn1dT3IRAFnkJovyYxm3XA3awYrB7MH
	Y7ebTFIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wldc5-00000005gAJ-14LZ;
	Mon, 20 Jul 2026 02:20:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wldc2-00000005g8B-1uz3
	for ath12k@lists.infradead.org;
	Mon, 20 Jul 2026 02:20:11 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNss3b756580
	for <ath12k@lists.infradead.org>; Mon, 20 Jul 2026 02:20:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WwYCea8We6mdjWm+dC6kPkTmaclY2KKsawC/nEua+YM=; b=MoWD+ea/sFbiCg2X
	7GR8vHVuokwWB4yy/3OH9zhziJEkOK9Ft1l32QWhYabo1c0vcPJqAIqOl9kxJKqp
	uKZGHf29Q3l6vFg2sIf7lmcda7shqXnZ9/QQ2gFehvLLho06wKywqZkC3RPhMPIN
	ZZHRoUOT/QzzqR91rmBkcSX7j6PsF2lQZ1mFcvUtaAWMu+sb6vrJ3hybPGgwSHbZ
	xzPjtdHxWS6X/gjGw6MuEEzsk/BWC2m6V2LM5Akg64anM5RBAALwJ7717+yIO8ZW
	Y5697mrbNV7uWxgeCuq54js4Xk6tKIel8jm7WzhwTqNuWOAqJnbocBqUkWVPVx0t
	vNh8dw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bnkyfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 20 Jul 2026 02:20:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccd1958e8fso87889535ad.2
        for <ath12k@lists.infradead.org>; Sun, 19 Jul 2026 19:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784514008; x=1785118808; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WwYCea8We6mdjWm+dC6kPkTmaclY2KKsawC/nEua+YM=;
        b=a2Aeezgbx5w5aK/LLjUtFP3OXTV0hDAlv/pFSKkBPfS9jS1zqhg7n1LdYQBxF4ar0R
         q6FZomehL4G+JSOgXpslo2R3gFQ/Y0n4IRErx3LKDxcH66McbIdpZc1NK5z2fhV1ory1
         p1ElkKlJgOS+BLjEVGWh9uaEG92UKAT3kqqlRGClO53T+TrZi3r39EKfm0ZZSLth01fi
         ZxWpFkRZBSC4U/U8PLJToKSvAcfxJCiLa45Ol03LhXouXM3f3sRsY1AnO2ir/pXpuZ1v
         SiYCaGOymDg69z5zGZFO2847/HtrUJcPC4j2zXYKVRTLVmgjuLN91qK1PwYQ/NuC0Obb
         /uvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784514008; x=1785118808;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WwYCea8We6mdjWm+dC6kPkTmaclY2KKsawC/nEua+YM=;
        b=EY3Ex7J5wdrW8oot60PKhTR0ztS1grXe2K3kFcwWDICF49SW76GvIL4Fi3yaVpc9SJ
         pWDZadkylg86pS/Ac14+R3YND8xWLXsugVzJKlSHwD0xZ1oKSqWRoYo0EmTOcRhcz5i+
         qzCNvbsody5CWlkUjEEnMRdTi2SR1csFnVN0UJ1sUVlTOywBfBn04Pbv+5OJmfouCeoE
         6PBt4HExSKgWH+dK+0MZhJyonQliZ/ChpmILJrZ8z0WyDi2WxlPl7Gf9impsnGtGKbfF
         qh9nEgq/edAXquxkhB25cnXjqJgg9MqRCF6+tYcbxolKEUK7JbQPocQE7gctNsMG+X2E
         6lEA==
X-Forwarded-Encrypted: i=1; AHgh+RpSe/4e//uUEVatObwMylVUS4rQ6PZJxpvQUsFv5u9Mwwby3/Ij7LxL1zfIEZELKrz9KtSVuOI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6dfG7uR50DeA8cJQmKigRXcf3J+bktcuHvxyGGvnHKlt5z4Hd
	hH47CKyDTqlGyZKJKwSN7SYZxPtI/k5x2zyRBLAx7wFwV8b1vVLJ5XMN/pqKIbLKh3qSrydJBPj
	BNgdCIkiwKmOQPQXsf/AP/9EemrvII8pCSNbcxjmp/mV7S6xSoeFXQQStg8T1NQos
X-Gm-Gg: AfdE7ckD/i+ktvYV8hllMgtLpsJZptIKyaUi4vFrLr8zmQidUNH/A5fXY51zGYNnCrj
	3ry0B5NrhAFMFMK71aG0qkx1Y1IgZ2eozN7aDMSgHKwaWOeqCZd6+j87chwPoQRbYLGcPAKm/6s
	W+PqE1B8+TbhjnaU3el5KG3TE7+TTyMlGj8MM2SX0PjzUoMPAgKo3U46N561GVrC+VoRng0JT6l
	sTbVm3/47IcWkiNfKiCysIMKQ3qljJ38M2aIRGI8iqUL0yonccQusNogU+xNCHTdV0iUDqCzMhx
	8qb5ZPlGQ5qMwKu20fInQMbNlhEi09Flok04lPBEWIpnFISDle542JsTnxrmCYHG34Yp8Db7FU+
	Tyi162Zwg6IbYBTVm8uljKTf0o62fcsXVxUjSe7wzgTwo0Hv5k7YmlbHxMJZ2SDJneIBqjj/y
X-Received: by 2002:a17:903:3b85:b0:2cc:777f:d67c with SMTP id d9443c01a7336-2cf3488b0d2mr126545095ad.13.1784514008108;
        Sun, 19 Jul 2026 19:20:08 -0700 (PDT)
X-Received: by 2002:a17:903:3b85:b0:2cc:777f:d67c with SMTP id d9443c01a7336-2cf3488b0d2mr126544685ad.13.1784514007385;
        Sun, 19 Jul 2026 19:20:07 -0700 (PDT)
Received: from [10.133.33.82] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344b1348sm48167765ad.18.2026.07.19.19.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 19:20:06 -0700 (PDT)
Message-ID: <7d76cc32-5022-48c1-b33d-f16521ab5b7a@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:20:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] wifi: ath11k/ath12k: release QMI handles on late
 init failures
To: Guangshuo Li <lgs201920130244@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
        Anilkumar Kolli <quic_akolli@quicinc.com>,
        Ganesh Sesetti <gseset@codeaurora.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org
References: <20260718074026.3085688-1-lgs201920130244@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260718074026.3085688-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kyD8H4bCWdyKgQZ6FXp2pYMRpk0BoUaB
X-Proofpoint-ORIG-GUID: kyD8H4bCWdyKgQZ6FXp2pYMRpk0BoUaB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAyMSBTYWx0ZWRfXyqHMlfA+zNTl
 FQ/dEWeG11JVen/m/7KLtvIb2LPpWhRBRhx0y/jHOXv0XXRy8+3XW1Czc2/Ah9J/cxLrk09gl0x
 HLSmJBtE8Zhs+czBSDiw7ouLLKLkRuT0DPb+ndN5Y1blxIz9ee4UcnapWg0HCqrWZWNvMExkwt9
 z9iHZtfovLZuT+SdmQNurmhCvogvBUhguazx/I+ZJLZriAm2CSpMkl6dGUjHWLjr8aBJIjMU1KI
 QPhKWNCbgW89u773jHp2sKqZpBNOTmTIzB6jA+Q08HbvGqYyyTcYfXSxH8Oog9/r5Zw7Lf+4nU0
 uEJydfUpnmQ2R8lblvimqEa7sL3RTZxiIAgNSyXybcvow7eb2devZjOVq1G4ZlYyldLpI3JtZ18
 8ImvASZ7O9x2qKwy0EQqbe+BZ64K2z9MlXVr/BgGs5yR0fLU1gl/p3MynHa6ACpOb7MQQTCprZ1
 934qZ8WNMtzlTXzP0hg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAyMSBTYWx0ZWRfX69SHrXpRyUX4
 oaWjXtLjAItW+afuGvrUmVMiB8NFIR8ecVTKDJFjUXrNnOyYLrnyjO+m429XkfS1FJALX+yfyY9
 1RN8EO7esfzZTvlK798+WyF7OOHr13w=
X-Authority-Analysis: v=2.4 cv=YsQ/gYYX c=1 sm=1 tr=0 ts=6a5d85d9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=9O-bytELmrVEQ99AJk0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_192010_608909_C31CDEC8 
X-CRM114-Status: GOOD (  12.55  )
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



On 7/18/2026 3:40 PM, Guangshuo Li wrote:
> This series fixes QMI handle leaks in the late initialization failure
> paths of ath11k and ath12k.
> 
> Both drivers initialize the QMI handle before allocating the QMI event
> workqueue and registering the service lookup. If either of these later
> steps fails, the initialized QMI handle is not released.
> 
> Patch 1 fixes the leak in ath11k.
> 
> Patch 2 fixes the leak in ath12k and sets ab->qmi.ab only after QMI
> service initialization completes successfully.
> 
> v3:
>   - Split the ath11k and ath12k changes into separate patches, as
>     requested by Jeff Johnson.
> 
> v2:
>   - Set ath12k ab->qmi.ab only after QMI service initialization succeeds,
>     as suggested by Baochen Qiang.
>   - Fix the same late initialization QMI handle leak in ath11k, as
>     suggested by Vasanthakumar Thiagarajan.
>   - Drop the Reviewed-by tag due to the code changes.
> 
> Guangshuo Li (2):
>   wifi: ath11k: release QMI handle on late init failures
>   wifi: ath12k: release QMI handle on late init failures
> 
>  drivers/net/wireless/ath/ath11k/qmi.c | 10 ++++++++--
>  drivers/net/wireless/ath/ath12k/qmi.c | 13 ++++++++++---
>  2 files changed, 18 insertions(+), 5 deletions(-)
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


