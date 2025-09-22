Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C917BCA100F
	for <ath12k@archiver.kernel.org>; Mon, 22 Sep 2025 20:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PiEv48j5rWcaAqxNJGzE/96rwguoW5QgNkq7JH6PInI=; b=i3sCIvOQk9IRS3WeeTKzFfGEnK
	JgAOjRxxtj8SYeEb8JUn/oZ+oJjP5TnaFAAt1a1IDMgt6YKOrM4Fza15sP8zAqdAc3Go6CZ/OiXRM
	ctu3Gr4D26UnEUsCj8koRNb+V0CKp+KAB950U5TEBCzU8Ty0c5OORcAl9xUwNmeY9aL4SiFHlB+rd
	EMQO9SWLvImD+ShFoYYL40LK3LknzD/oTON3S2Sxen4+A+W+IkyV1p6jLu3ODCpD3ofFfuiIsw7n5
	W4kFKel70GA2NnrwI9DSjzVI3IYb6ETbDnxJcX2iYDtYz/x+bf89jr/BIcTDCv+7p5tJ6h93zL/kh
	O/BnW3Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nNO-0000000BTQ3-2SCE;
	Mon, 22 Sep 2025 20:43:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nNL-0000000BTOy-3TPk
	for ath12k@lists.infradead.org;
	Mon, 22 Sep 2025 20:43:09 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MGVMoa003414
	for <ath12k@lists.infradead.org>; Mon, 22 Sep 2025 20:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PiEv48j5rWcaAqxNJGzE/96rwguoW5QgNkq7JH6PInI=; b=Dg6HGniuAFPpZpd0
	9Opv2Xsco/IP+PSOQoRyjkrQ3jXbUGBE0TK4VlJ4HrijiPil0Qy9Elj8iStERSYR
	t3BLB0IQXOMuvbLGXUNo9yotAGvYZFxCLYwoBF82pbTcbSjeFcSfFGaU4CRfuvaZ
	+jHToQqG3azzwC5hu620B9CltYjqOvDs9vn789nmrTq1L67r7Yaucudn4/0Vz0Iu
	Ovn8fFd7m6bUBFmqpZMOtsZ0cuQFdEVHK+eSDZPmARkpKM4Ec88uQdMrNuWdf4uc
	ZDbeR1eibvln+0i8LmY7wVudm9oDGmv7fxSlwnj8x6R4iCpf9XSmdTbuQlSidAc4
	f0F7EA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mg3641k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 22 Sep 2025 20:43:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-329cb4c3f78so4231643a91.2
        for <ath12k@lists.infradead.org>; Mon, 22 Sep 2025 13:43:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758573785; x=1759178585;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PiEv48j5rWcaAqxNJGzE/96rwguoW5QgNkq7JH6PInI=;
        b=XGyd+nW0+oWiTf98T8iWHlsan4PCkNgBSc2NVPB23wgWAVqHPCwFPinVPqgwxTJ1CM
         6f/wAodvGF6Spy5WoqJl1YIyKd0hZTjX5/hkvXUQjzb9ExCKXGgdaqWt35P70aCkT5oW
         Dn8ICI1a1iGbWzbopxIhwDxz0eH883ZVoX+txUeVoqRzAHJJKYAhIMzyA5Lj7E/2Wcgq
         uOtS39cTSyRf+MWu967MIHjVGUiRPKLp12bFNAD4HSaqusQQdSVXUoq9FYsb2vIb5ce2
         Z7lGKoH8gcD0aNd3YJcsM1yp9j6+PQBlGMYYk4AJnCrPh+bAA3VV7uONS4cMB6pdMDi4
         uMFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOpzww61ge4z9dOn22z1c1ebckWHLXspAVMa/ldpu8rQ92JMFOqtf3aIrVkgfZwzt/NPUZPOs=@lists.infradead.org
X-Gm-Message-State: AOJu0YwNpV1YYvkpn/uJ+bQXZ5AqGosL/DNEHMpKz1nJsXLdJrhXcyKe
	fc2c3mwGglO5CnVCzdn2/CzYASzwn4cYdsodcwq5aQ7pchlV2+0IGD6Z/xEgoyrHz+Z8OLI63fP
	xDqYkw8QjX+GLqJKMKzVSD9XMqWnhfRScR9XH1Yvw+cUWo6xuUMHdQ3JeUobHWEeC
X-Gm-Gg: ASbGnctvLPDUCIr9AYW6tuvAZmgaRgQCYTDeWZHIAKq9RCtniaT9qUUb1dkJs5/rBoX
	4ZyRMLNvO5XTS6zdV/OsB64M+TCJwQdyF2Nk9lp/L15cKC5vmOwuSL3DdTzGyurQ0jR/icNXD1m
	ma+XIpsuTMKU7zQQVYS9O915dR5YQYl8K2vwZtEKzqqvft/MMMf5W0h7L/KIoNj0M1Z+qfXUjBM
	pj5Jz2Zx0p+OBTZCXfH2VwKqIg8coMSLDxZwio8iWv89IUzw0jzglcel/uOQnciClLHm1kvlasL
	78ptiV9LmkuofCq/mFEGrpTg4IjIyIAo241zpCgMT4mC+/Gc00pWHPlEnwO8eMXK6IWoRa9URfv
	N
X-Received: by 2002:a17:902:e84d:b0:263:ac60:fc41 with SMTP id d9443c01a7336-27cc76e2007mr1508945ad.48.1758573785333;
        Mon, 22 Sep 2025 13:43:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDg5SUvDYpoOi4QrqEmsVu3tSJHlXvWSpdSXO07XSYwVXcsF4lRFp4zQ4axpAHjLd9A8W2DA==
X-Received: by 2002:a17:902:e84d:b0:263:ac60:fc41 with SMTP id d9443c01a7336-27cc76e2007mr1508765ad.48.1758573784942;
        Mon, 22 Sep 2025 13:43:04 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27cc8b251f7sm817935ad.8.2025.09.22.13.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 13:43:04 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250922061607.11543-1-alexander.wilhelm@westermo.com>
References: <20250922061607.11543-1-alexander.wilhelm@westermo.com>
Subject: Re: [PATCH] wifi: ath12k: enforce CPU endian format for all QMI
 data
Message-Id: <175857378428.47334.188951936542723567.b4-ty@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 13:43:04 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMiBTYWx0ZWRfX6byTZkD2r5jb
 KANBlKe5Uv1BjT2H9dB1GsZ8PxzKvt6iHmCgIurWly/nTmwPZSMqUISVWhZm6y6tqEWZEC6ANQv
 /d6qnr3teRp9LWOxvMFGBu50xcoiZ1qtIkx/Xl/LLkPMAcgYLb3UO13/+mYwGjRzJCgkyKxO6te
 jt29obUVPmnfhODkWk9ylnqQrnNa0t2eFFda5TI5Av2KFDekc5BZB1iCztzYJn8h8tmI62690jt
 LSLPKOVL7B66db2AMpkL85GXFdHHw9lbsAjkmBHllFmorb5cUnoB9/qVYFs2S+k3wQc4Fa3xCPb
 /51rkKq6UhIONqV4BCmYRfksEpheH9JjgXodMqERoxBzMIvm7fdllF2yi9sYOpdrgrDMwPvdh3s
 M3sWMlMU
X-Proofpoint-GUID: 6m04iZlzeA0h_iPO44OUbc09IFK8-78E
X-Authority-Analysis: v=2.4 cv=UvtjN/wB c=1 sm=1 tr=0 ts=68d1b4da cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=141ELwY65cG9oRu6GBAA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 6m04iZlzeA0h_iPO44OUbc09IFK8-78E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_04,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_134307_874203_A3008031 
X-CRM114-Status: UNSURE (   9.17  )
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


On Mon, 22 Sep 2025 08:16:06 +0200, Alexander Wilhelm wrote:
> Currently, the QMI interface only works on little endian systems due to how
> it encodes and decodes data. Most QMI related data structures do not use
> endian specific types and are already defined in CPU native order. The
> ath12k specific QMI structs are an exception: they use partially endian
> specific types, which prevents the QMI interface from being extended to
> support big endian systems.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: enforce CPU endian format for all QMI data
      commit: 9eb6f553026e1268a62aa352af38f70fe7d42a46

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


