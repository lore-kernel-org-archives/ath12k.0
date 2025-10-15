Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386DBCCD185
	for <ath12k@archiver.kernel.org>; Wed, 15 Oct 2025 23:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JN9sVLu+a4PjGTCXxkztPeS/5WtgaxXqbM3gWtB+1Wc=; b=LWJAw/UF1RLj8drgF6b1i4JtR2
	31LNFwujI/30m7tmQe0pyq4+usgCXksIneuhEa9EFgHMCSQEH8LWYHGEJbtimR4ZeWBnk22ZgrPCK
	h9AoOqzuoCxzG87GsSH2CUVpB7CoplKMfGV9THp2UIs1rwbDhggV2ew6DJWfoSY4AsZOhpG3wTgHe
	kjJTDb4ugtZNkagJP5Tw9K/RHjvAnALRpHR+4QwbTcLSaHCy/MBOoGvJtpJshCF0BLC7ySjHGCRzH
	ZSJB54l/UHJuMnJmA1hSaSGC5qcoGA9nFSHNVI713EVBNLf3yyVezZHXfSI+QGWl4+WqjgoQ2Pm/A
	GVHIAWEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9B6h-000000035lo-45a7;
	Wed, 15 Oct 2025 23:40:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9B6f-000000035if-3Ur6
	for ath12k@lists.infradead.org;
	Wed, 15 Oct 2025 23:40:35 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FIp8Uo003849
	for <ath12k@lists.infradead.org>; Wed, 15 Oct 2025 23:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JN9sVLu+a4PjGTCXxkztPeS/5WtgaxXqbM3gWtB+1Wc=; b=WDUnIY7qqTjNpsKV
	nodmW/589QlozQjuYNSlCJbvdix6ByKfv30FJ50JeyoBYNtCsmoBIkrF/vsstNMO
	xMzSM1K3G2zEZU9JyvKmwN7Fzq/GEkAWdo/8F02xfOWwORRndUVoxiUj/IGYagc+
	NYIXj0JMYwxTHq6R+x7MrSsKQMiD8MCWIy1BAuDkKO6u7hmugfJg+RBb68S38sPq
	27akgKRSjInSC8vGVbn0zsv1+7e6oDrCRCZXBKMNL2SeNZHUuE8V4WlgL0CTp7XV
	IFrkhkoVsycV0CcpuH7LvlSAwNTBBoRPnskzl8t9oNy+YzHfNy4eyUnzf6qMmIgg
	4MboRw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49sua8mwmd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 15 Oct 2025 23:40:32 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-28973df6a90so1301325ad.2
        for <ath12k@lists.infradead.org>; Wed, 15 Oct 2025 16:40:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760571631; x=1761176431;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JN9sVLu+a4PjGTCXxkztPeS/5WtgaxXqbM3gWtB+1Wc=;
        b=lZ2gXvoQSecMN0/LRrMeiwZel1VZFurLJtqkGpCJeE9VZMI+KtCiyUX9P+z8yzQTzY
         /3wvUKQb29U1d8pzwFp6S8ASpsrhYs64jO7nTgFQ6PvbcxFfX7iKVHq1ZfgVh3np4gJi
         O+6LBQCmbvaUPQk1H7lLo7dSWCKSuoy+3WqdAzwwy6kP2iHfQAYx38QBoBjR+zAlSkG4
         NSCyVBYbxMajPIoAn3G2VYw7LXdiZArZB5kajzVmxc1Yo6Pb72Z+0t32GNbsaJ4xOcUf
         wbLkq44q8pT+TafOK77jf2gt4WTTZPcTtJrI1IdQMwoZ7qMrOlI1urkMswVO0NuQ2CU6
         TqKw==
X-Gm-Message-State: AOJu0Ywf7w7SWrW6YGPij8Id43XIZ4ui3N8v9XYhWsL3LE9nkiDfZfhx
	vCzqsdb258zn5W8tDocU/Dr0KPHjWZ4vAkDfOiKgISfjgESXmGSIHjpH3JgNtr3oPi5HkhB+Zor
	w9L/FVXI2B3io/ivezbFMEQECWa5RK4ZlZpkAQJpws0P47gpHWjommWYAaMJGvIZk
X-Gm-Gg: ASbGncvVR2So+iIaSTD+BxnV3Tfn/CAy0mOY67wS43U3MQQD7qiDeTXLg3QL6TUr1QR
	jlsTzSu3slKIkzkgNNFYjLRwqg03n5LlNqmCEie1vaFqj44OxwZKIfNJoF09bvFaWNmg6/7ah/o
	OeyfUnLKEbWdr4yKl22fIgZ75LPf96GCxnSBQoAAGm2Q6G7GssleU0XoGThBHxQtsRWny738/sP
	rDLZiMjvA0oyJrG1YcD4Up06ZVQauuO6NvdKeHIlRSRPjo0tDLvKRHF7t5rsnUga9SCBBHTSKtj
	MgtEi/v2E5qsRaV1XVzcWQ7mJzsMe1ZVaKiTlFpa/xSYzt2UmmbHAI3l6CDCmk7CRWdp56pDehc
	MMuvGjgC+Y5BG5CU7m82+hR/BBuHhJ9RA3xo=
X-Received: by 2002:a17:903:37d0:b0:28d:1936:ee9a with SMTP id d9443c01a7336-290273ed7c7mr395820975ad.29.1760571631590;
        Wed, 15 Oct 2025 16:40:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEx9/Zjh+cw65UvBzvZIJ5TaNJbwq7xsNwcsRRA90SFXBFxs2t0VrnT2QlohmCo8U7d7vlx+g==
X-Received: by 2002:a17:903:37d0:b0:28d:1936:ee9a with SMTP id d9443c01a7336-290273ed7c7mr395820735ad.29.1760571631155;
        Wed, 15 Oct 2025 16:40:31 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7c255sm8055635ad.70.2025.10.15.16.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 16:40:30 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Cc: linux-wireless@vger.kernel.org, Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20251009211656.2386085-1-quic_pradeepc@quicinc.com>
References: <20251009211656.2386085-1-quic_pradeepc@quicinc.com>
Subject: Re: [PATCH ath-next V17 0/2] wifi: ath12k: fix TX and RX MCS
 configurations in VHT and HE modes
Message-Id: <176057163051.260563.14889563082385358243.b4-ty@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 16:40:30 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: J0UDCIcqAWrLXZfYKiOLG7iK4Ml0h2sh
X-Authority-Analysis: v=2.4 cv=e5MLiKp/ c=1 sm=1 tr=0 ts=68f030f0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=1T_kBm5XZ40ICzLEKyUA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDEzNCBTYWx0ZWRfX1EeY03ME29vE
 4MwRQlekXBohR4RierPv+P2IqT8fdUoNfF8C+N3UBDoBwUG8YWy8SAfVMjDQw77sU+CBYMWcGUB
 GotZzsmkmwzAPOdedmL2A7cGPF/8B6ejBFd95WIdUjF49jVceOoRrFmonR52osCcQvf8bZFoc+A
 FCQC4IpUd9LKWkSIaGfiCq044DB94u9YxxDAGcqlj37zIBdz2M0y/wO6QjLgnjz6xuLQKgR9zrE
 LmFGrPWT2pX1mxcV1horHPLN4mFJgkVGLNX9yD97dd6q5+1gtBw4R2InaUAe1lI88RjuTN4jLIZ
 sAUtSm8JhgRovMxRPFITQERwRmTP3dHj7QuCKsCNaBqj0jUoFUfdjSp9FFkBK6xX+s7VonuN3kL
 SYGd7cE5pTiiNGvQ80sV5Le2JGPDnA==
X-Proofpoint-ORIG-GUID: J0UDCIcqAWrLXZfYKiOLG7iK4Ml0h2sh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510140134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_164034_037226_1B443CA8 
X-CRM114-Status: UNSURE (   8.63  )
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


On Thu, 09 Oct 2025 14:16:54 -0700, Pradeep Kumar Chitrapu wrote:
> This is revision version for patch:
> https://patchwork.kernel.org/project/linux-wireless/patch/20250701010408.1257201-6-quic_pradeepc@quicinc.com/
> 
> changes in v17:
>  - fix spelling in description.
>  - change wmi.c wmi.h copy right per guidelines.
>  - fix missing recalculation of v for TX MCS 160 in patch 2/2.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: fix VHT MCS assignment
      commit: 8c21b32c2cc82224c7fc1a9f67318f3b1199744b
[2/2] wifi: ath12k: fix TX and RX MCS rate configurations in HE mode
      commit: 9c5f229b1312a31aff762b2111f6751e4e3722fe

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


