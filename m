Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E22C44520
	for <ath12k@archiver.kernel.org>; Fri, 17 Jul 2026 15:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1nCywQWS6dZxbdmHFPkFz283Nd96b30DE91wyblDKLY=; b=RhQUOmPVnETv3vybaKnr+ZR1eN
	LHAxJ0GQjXB7GTBqstn/IS5eyES00NL8daK0mdj/bxWJ2fQJ5R2S4mQEdsOpw62URtB4KcHZWNjH6
	Pq7t1ipx1LfoGUKK6DmMpQ7kPVJYGxupHtouGjPWTmJMnvfgGJ5+vtM4qWY8tZdnlRcuc+g/ExKmK
	T6PstcCmfXGpqEzqKf0Qys7Gf/sNJEaEqJNX+OBd8ieUWTtw8OkNDAxLEURgWjuG5/78EDQjmcOQR
	35hwo5G4qZWr3tzraNTs23kGUBX+jB82TVAzIGplGs1n5DR9unD7hvX/GmGR2e7XG/eBdsSzJ/Ff3
	qW0nii9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkk8g-00000002YSV-0Yum;
	Fri, 17 Jul 2026 15:06:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkk8c-00000002YQS-41La
	for ath12k@lists.infradead.org;
	Fri, 17 Jul 2026 15:06:08 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7oa72187190
	for <ath12k@lists.infradead.org>; Fri, 17 Jul 2026 15:06:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1nCywQWS6dZxbdmHFPkFz283Nd96b30DE91wyblDKLY=; b=SflrSQlZKWEcCAGH
	d1Zss4ELEOd+lVP3v6L8EzMVjdJD+TWyXn+BlBShN39bPu/qsi2RTskPqvMh5s8l
	kYMJfqqnevwywPo9kEQjSxymzJoyFu0o7zl56KPL45sI5nF7gXVUGDTpFAk8TjSR
	pLRtbJTIknh+MqSmAGRoXlYxfGNUeDU/WehZkOoFgcXyPL9kqiH8fe17Zd4V3JmR
	qIRqedHqL7EKCKIF/OpvG8YKYpNjF8xgVw3GqScZPXpdW7VzZV6SUG2SsdLc97gp
	fjmcU1QFdRmTD/fWTO62biE6uF9KBw4BtxmJeRXSnkENpe4ZbArQqlzflYHdkc81
	vhJBLg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffd3atd28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 17 Jul 2026 15:06:06 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dbf293831so10357126a91.3
        for <ath12k@lists.infradead.org>; Fri, 17 Jul 2026 08:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784300766; x=1784905566; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1nCywQWS6dZxbdmHFPkFz283Nd96b30DE91wyblDKLY=;
        b=dl0xKIjrSLKSSrNngWvi9i3i8f0FJOohVShvEY13OBNTbeP+UWa2LjU/jNRK725lCO
         tmyZOavUePNzsLkk/0n2+E3m2yW1GfdWmbOD3lRAf2JHphroZwlW4nqzrLND/PaPqDHW
         +pC9MTNjQ7pvKr69v+qNVqcVPQGoFV0TKdv2kf20rkLSDWUxo4I5lVyULe15eLVocgFZ
         go8wtmjthL/f4/wa1HUq2s+Zfxr0abcJPvoHkVzI7AJFKUE3cXS090U99cOBOFYS8R6O
         hHy+AGzTPb80HGWgmQPLNMoFTos01iq7rTCAHi/Xw8rRhoJ44s97iDPfBNzX58o/GQE1
         wUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784300766; x=1784905566;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1nCywQWS6dZxbdmHFPkFz283Nd96b30DE91wyblDKLY=;
        b=det3vkkmEUPibAaSdgq40oUAmvDLkiMYTgF4ZOB73L2gKVkBobJiwmy/Oa+vUDvoFu
         UypYYogkKntQCe+k84tbi6EUR1d1TUjuIOxnNFQj9GYFcrd+0CWdUg4EzdloSlnP71bm
         TSTFbo+7PL8L+zJf7Q7aK4tElfugtFWYljrYIh2BWAPniKCqY57Sdxpeo9UnlcGxIkPO
         vMJNLfth/2Jr9esJ2QHIPgueKb2d6ivhqJ8bvi06sx8YG9tl+Dmj2bLoNXFpaAFGm14D
         Jdji1JRdM6SZZkbux6paZdCd+r3OfyDJilaS/YmiVucKc4dJ/xZyd6tUf1oppwuG8ykS
         6TZQ==
X-Gm-Message-State: AOJu0Yxn4YwV/XHJY7z+OMadHrWnZoCyfpFiL6MO9sFQy6cK3UfGNL4u
	xK0bCd+FlGXsybBNT7rIJGBNVtHFZwPb5Sw1vqx58157bsa1PKrcU4NJnUhZDsKyeVXKSuqlV9A
	8NYL86rejU36HT9CCCVLKvqkXpasrn6BGiqeDspMR3WKS/rkbIGLEKkl3/OuszNmz
X-Gm-Gg: AfdE7cnMLPUypEv5bT96kjkQr6jbJ/Y1lC608oaj59KoDVCIz4rQ7Qsg5bPyFpddkGT
	ZCpOd1jAW6FOzZePTtwJPcpAFw9dunFZd9FT6yUcciFiqUB28Kqcf9IjsnWJIlt67lhaG68cspE
	CvnVmykcoMq+eadFGcwz0lQVWrNKIiDFcghSxO4ISfdUJnk8erfGJsKD0FGbtbNs+lYIMXQZ12r
	40fEPWGUfXJcCGiUEd3spDiayUBE4iohHWmyhFVrNbmFkdOoQbaC+O5mr5n0AwJ7pCI0nHHrorz
	N//L+nFM85HOjH+UhhFvh9rFF5ZZrcCtTLsdZRyJfn0gFWJ4WI862px8sMqIwO8SHS76y7MM3uo
	ntLFhuM3YVInnKdxzJ8I6Fh1FrEbCszyyv5VBR17/L0GurEN8U9S6eRU=
X-Received: by 2002:a17:90b:3c86:b0:381:20b:a9ee with SMTP id 98e67ed59e1d1-38e4b4578ddmr3351569a91.14.1784300765868;
        Fri, 17 Jul 2026 08:06:05 -0700 (PDT)
X-Received: by 2002:a17:90b:3c86:b0:381:20b:a9ee with SMTP id 98e67ed59e1d1-38e4b4578ddmr3351503a91.14.1784300765266;
        Fri, 17 Jul 2026 08:06:05 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1dde81sm15681190eec.21.2026.07.17.08.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:06:04 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260630062048.1615178-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260630062048.1615178-1-aaradhana.sahu@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2 0/3] wifi: ath12k: Fix memory allocation
 and improve reserved memory handling
Message-Id: <178430076400.128359.5468109327642827422.b4-ty@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 08:06:04 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE1NCBTYWx0ZWRfX4x7lXnSKUQuE
 sdnucVblzm5A4/i+pRNPQco7ZyJrrR9bRK79pDHwu3SGpZegCcEMOU48O21Z24K17MxQ/YGBq2y
 43IdXxRhBR3CwzS4qJULYOIYje/PRBA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE1NCBTYWx0ZWRfX9SBdKHwNO9pi
 wELGhK0j4xe1MjxxiVedPWEpdNnrohq5LmZyG00Nw1s2jn0jARIzpvsWY8NntkU+EF1WnesS6NL
 jkp+QncTvx8IOSufJgv6ii81wq9wAJ9ZY+vuu1vIwtxniMkIBLLM65Ex8S5ZXZwIa4ZF6MCTUQc
 w6TzdCnmCe9PPy7cj0PiCUSgvIWC1jOhZ8lJBsM2G3vEsPlOdBiFUvgYXe/crc4JVi8Cusa73a7
 jhZxMRf+dK/Rk5q8Dkg/nI/bQBGyiNDe2rWnYm/HHYhtPzQAu8CcJHFG3E2ZMxHICY27OczHvc3
 CEpC7EgZy2NpcEO1AV1VTwX1b5IjW2rke6cVyHPOmI7DIOi9vxair2HWaF/eELWLi0UI3FFhTSl
 BuhPrmV9+n0kPfc1zBEe6YwKUWBVG42HISM8ExGPZccqk58WqtMXKKf76rLOsd+e160KUEiMQ4t
 EWI1bx/uSn5UBln+2WA==
X-Proofpoint-GUID: QRlLZzt-t_YVHeYO_o6hMwowRzn015g0
X-Proofpoint-ORIG-GUID: QRlLZzt-t_YVHeYO_o6hMwowRzn015g0
X-Authority-Analysis: v=2.4 cv=e/M2j6p/ c=1 sm=1 tr=0 ts=6a5a44de cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=iHmrIn8OyF-cjVc_3aIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_080607_006018_9F8EDA7E 
X-CRM114-Status: UNSURE (   9.77  )
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


On Tue, 30 Jun 2026 11:50:45 +0530, Aaradhana Sahu wrote:
> The current implementation relies on index-based device tree reserved
> memory lookup. Different platform variants define reserved memory
> regions in different orders and combinations, making the index-based
> lookup fragile across platforms.
> 
> Currently, the driver allocates the HOST_DDR_REGION_TYPE
> starting from the base of the Q6 region, which overlaps the Q6 read-only
> firmware section. This causes firmware assertions during QMI memory
> allocation, as the firmware expects writable regions to be placed after the
> read-only section.
> 
> [...]

Applied, thanks!

[1/3] wifi: ath12k: switch to name-based reserved memory lookup
      commit: 2a1ac0368e1a891b1d1fa91192a2eaf865495f08
[2/3] wifi: ath12k: refactor QMI memory assignment
      commit: db4e4af6e8261d83c5658fc9a84fce37a9ae692a
[3/3] wifi: ath12k: allocate HOST_DDR and BDF regions after Q6 RO region
      commit: 3ed52d62f47de46dc1113671c057ff376d0fec27

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


