Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF330CA1016
	for <ath12k@archiver.kernel.org>; Mon,  8 Sep 2025 20:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmc/KncJcDRAf/6Ym1h7RSvUJ/Yk8F28mp2Cw4+IbTI=; b=Xb2sDsOiuyzH2XYrd1EYDdt9/A
	otnIc9nlWs65SzK6W0+iKY+TKcDk/gbAlrSWDKmk0SUnAU4g8EZzvqeU7jPvOUVUPHJ8jig4fGmkn
	Bz+9DsuYKU2zac2v+FZs41Yi4Emx0RKsYCMiZXyD+8714uQV2oAafcgX2pqW/FsuEwEZd+GtSeT1G
	uci31m4kMWn9M7LVKsG1VayccVAi2mBnpXhM7FNneZw6oVq9T/KBUuZxBofgQkgCA3XxCFJi9YkCs
	gZG66elb7QlBYJX1LxAJlOq69n+8UIU4PFcT0kvM1ltHPzxuxzJs+3EGSuhL7W6UlduK5f1BQyZY7
	zRstSlrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvibX-00000002EB8-2HBc;
	Mon, 08 Sep 2025 20:36:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvf43-00000000sYB-0uTr
	for ath12k@lists.infradead.org;
	Mon, 08 Sep 2025 16:50:00 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5889a9GG012487
	for <ath12k@lists.infradead.org>; Mon, 8 Sep 2025 16:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tmc/KncJcDRAf/6Ym1h7RSvUJ/Yk8F28mp2Cw4+IbTI=; b=T8Jo/J9r57K9cxfO
	nOgTGtQUJ+cWzprP6LsL0tNFyir5S9zbfLkSbc9k5/EjGaqzyPFD5ktblUtkLIKR
	Za5k8ID1/wfiw0B9tS6dSJPzwl9xJhTIWzU2+KEyYnN9WdqqYiNAH2nizgE37/uU
	/hSqmdljTisOGrAP4rHFLjACiClYJ/nbSbt9oxaUGEKeV7eBbqNu8zh3ijNYqRol
	tsYT5/JE34gYW6XBznhJu8Yk70nocJKTINu9Z8NgPP5I4MJGZy2kEpgiGEwgtasq
	DoNHhr4hQ5d7fcR6Mx0BZTg8n2RKX+JxU/DNLpHqMdpsk9JfRVSKdvCTG4eDMHUt
	7HlGcA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by8we09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 08 Sep 2025 16:49:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24cba71c71fso37367625ad.2
        for <ath12k@lists.infradead.org>; Mon, 08 Sep 2025 09:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757350197; x=1757954997;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tmc/KncJcDRAf/6Ym1h7RSvUJ/Yk8F28mp2Cw4+IbTI=;
        b=Q9FJ+6d/qBttCIXKCyRDtLrgLiTiNECIuXNbygLVeQkl8iWKX0/5SCGYH3c7800Sn9
         qpfrWLgWRCDIy3CWJRhr7Et/bpP4eBOx6cXEanPdU0KFuergtn9B/8bjjtcd0P3JR8tf
         8gKPF7N0fF57Ymq0RY9bwziBuTUL3VKgFzPwH8LmuEAg2EkIbGQFhMwX8nSFc3dbyWr2
         YJU4QaWEWHPWT+LneFan4wCH9X0BnqRM4wDv1yNzLxVxulm4rp6Uti1u7Va1xrVosfVj
         mDCxK7L/LnHebuzRR3fqwNrhWy5Uk8mnjvtC3bB/cVxAVqORd6Krbc97brWpYstISl4/
         mZsg==
X-Gm-Message-State: AOJu0YwALlU8ow5NmrX+/2e2S3tDwlxlMenMccOm+uboTCSqogkClATj
	n7Lc3rc700z/YXASO411PAqhpUnSJQpyib6UKjEXTZrt6m0hs2Ixn+pgQBw+DR5O3MR0tnQB45E
	5evgpGQNU5S1JLy3rBxVNYL1VaSUzfk5W3/OvbiZBpx46337WL6Jzo73UIl+6pZck
X-Gm-Gg: ASbGncsYPyICuWDGrFk6JdLKEe9gklivKhM5PT1+hT9GMd3e1aS1XP2Efefkl9PFl6C
	dnpcUXuSnvG3ByD/oGsXhGdXrO1G40olTwFK8f29BVRuHZ44fC1CyCV42r3GJNZ+t37s6gfk6z9
	xGnci0TMwagqRZuoDUseUqoSG23u0m9e6fvoWA3G/+2VfMgcKx5Jp88dLKLp5DZmZtOIulvKCVW
	wjKr3SF3bkzsvJQYAYKEyqdnvZLVlOygcENj04aXvnIVZFVeK0mee5GEvjbBQ6lSHzzZkfOEq0g
	1eWeCsF25WOKSvkPOLcMxaZdivyy8Rs4a82wenEwSINYuh/CqSrLRFz/N7v7vVWzHceE0iSpDse
	1
X-Received: by 2002:a17:902:ce89:b0:24e:229e:204e with SMTP id d9443c01a7336-2516da05c43mr113562655ad.16.1757350197045;
        Mon, 08 Sep 2025 09:49:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHndtWQTiMWDQbMOMbDHp6W6wnK7I1e6M9IeM3dg7nGZndf9T4LlIhZ3ILQvi+OcSxqbgjV1w==
X-Received: by 2002:a17:902:ce89:b0:24e:229e:204e with SMTP id d9443c01a7336-2516da05c43mr113562335ad.16.1757350196566;
        Mon, 08 Sep 2025 09:49:56 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24cb28c3147sm130460655ad.73.2025.09.08.09.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 09:49:56 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250908015139.1301437-1-miaoqing.pan@oss.qualcomm.com>
References: <20250908015139.1301437-1-miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH ath-current] wifi: ath12k: fix WMI TLV header
 misalignment
Message-Id: <175735019587.347840.16470768919118721674.b4-ty@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 09:49:55 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68bf0936 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=FHtBw0_P-ZgSNNpYaWgA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 9yx1HzqMikDqVYLlOpEunh9yqFO6TG2L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfXynpb5ZBqn1ot
 TmR7PEoNeEGvm+P17x3LqnMWLU1T2gfQkyr1Obh/vVJknGZOjuxlW/+AhSUAErlwJLuXV+eSj6Z
 VmGWVT3h0UKMMNS7JVbG2M4NfbrDymaPilG2QmYVXCGYJvsjYuId02Y7xynYkNZwOqXYuvNh6Uq
 0f3BPTtnaz6j5hbZcCt6HkM5WZ36+cb6Ebxv7qXq5HmRr5hJsOVBrKUs/UM+BpVOzUTHNdPqkpr
 4Kw9fLYY1+C9W9HsnioGpjmbHPMUKVQU0kHi1PeA5TD7ARAXqZ6PUgzeS5OpQJD0JhcQPIgb0No
 ibOA9tQs9bmsZqAPmib6oxmYJFW4kWaGADngxveRIoIG3XJZQg0nTL0xdZzLU2lqNNcRNJ3RS/1
 RPj3xRoj
X-Proofpoint-ORIG-GUID: 9yx1HzqMikDqVYLlOpEunh9yqFO6TG2L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_094959_409240_B40A77E7 
X-CRM114-Status: GOOD (  10.00  )
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


On Mon, 08 Sep 2025 09:51:39 +0800, Miaoqing Pan wrote:
> When buf_len is not 4-byte aligned in ath12k_wmi_mgmt_send(), the
> firmware asserts and triggers a recovery. The following error
> messages are observed:
> 
> ath12k_pci 0004:01:00.0: failed to submit WMI_MGMT_TX_SEND_CMDID cmd
> ath12k_pci 0004:01:00.0: failed to send mgmt frame: -108
> ath12k_pci 0004:01:00.0: failed to tx mgmt frame, vdev_id 0 :-108
> ath12k_pci 0004:01:00.0: waiting recovery start...
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix WMI TLV header misalignment
      commit: 82e2be57d544ff9ad4696c85600827b39be8ce9e

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


