Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32C6C54799
	for <ath12k@archiver.kernel.org>; Mon, 19 May 2025 18:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ki30LBVSh/m/cS8iJTZ5EjzlsryTFaBrVqN1bd9yR+A=; b=vDJuNzHrpj7OxV3+OZ/ksfrsZJ
	j3Y8ZgLKBvDSy8uD5TszB+LEM1839bi347wR0UU+3HU7DGG5oA6LuQuadIvcEd65O5+UsnbUFNG7O
	eidS4hTeFnlw0hNBsmPBVBRSfNOYBXKkDVfUzfw55BaKLYVACbhpPMlsPopN5SyPYCXdEjL/TJ6fG
	1Nkwxe1Q/M1u41+80yFJmoXZ/PUnCYE41dKAeBh/gxd93IA1haXorY3yAmM67tZrpkMkJ4Rs1qxlX
	RwnkDJx+q1f7KRTeyL155TmyVsFtrRnIFnLpQGU3tcV7uUwobCIiCxsykRwQovVzxvH7BlnHdZPcT
	82eYl35w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH56b-0000000A7ja-1h86;
	Mon, 19 May 2025 18:20:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4ay-0000000A0vn-2BpH
	for ath12k@lists.infradead.org;
	Mon, 19 May 2025 17:48:13 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JEK5Tb006080
	for <ath12k@lists.infradead.org>; Mon, 19 May 2025 17:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ki30LBVSh/m/cS8iJTZ5EjzlsryTFaBrVqN1bd9yR+A=; b=ltm3QLGVTYC6ZrI1
	gat0/SKJENLXLXzsmaHfWlLAJ5pZWxoHQ2mKoTva0fZLOgjGWaExNR94M2xru+r1
	c9dBAaXiYZcIbL6Ll+ex5cM7FoqRG38r460lVdRhVI7rkz4tl62kOht3KF480a9D
	hIkCXeFdNAoNc8SwwVxmoA6Dsrss0qb3uX1i5hDkWEFSBTwq7Bp2SVY6K9ZRUYi+
	LaDvAsKNK9un9dbneTJnuzb508vpX6T2SeidkrxhnKiOeqrF57e4uhR9SGVqHtDo
	7wxu7YSz/RoqC5IpX2WLPbkc1Ia7oUxJXRSXKPMrdhG0jZVCMNE/XuwOd5qWLo5D
	XoF1TQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qybkhw7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 19 May 2025 17:48:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-231e76f6eafso26612135ad.0
        for <ath12k@lists.infradead.org>; Mon, 19 May 2025 10:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747676891; x=1748281691;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ki30LBVSh/m/cS8iJTZ5EjzlsryTFaBrVqN1bd9yR+A=;
        b=stuE7M1mRbYTwp6FusSv0NEYi2ITOd3XmBwf15CP1PSf5+xVQSy1fsDRbmn2Y3f/W/
         iDu8nZzMf+lYWpcXUerqxHD9R/SosEzGRDNAKXzL5HtSf/W2lcuuIeoTULNc0u5MzWWE
         ueOIM5C/v6P3LaaK22JAFJr3mLlU2Aw4HQyw6D2PRhwqak5kZH+ylUDBnphbc34eQPfn
         /WJTfiPFwe0Kq4N9TqHhAfL0rwulS5CoNqSk4i5ggyaGmmx+0A027vwgeeNf0i3ARBED
         B6ia28xaYoqV6VHlENc5t5VuloS/F8412qN5ZSWSjfaf6THp25L3IX80/XQtmtLK/7/S
         LfGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpgdqQnudREvECikZLbN3xQpI06UkFvtx5Zf9429T4Ou9haHYSLe+MNJ186ZdGYVCXGxn9GU4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzKZ+uN5nJSR9m1VbnsDQGuB5t3SrNu7EHnDvwH9zJnRXvriyig
	DkxSsvtgA48HxhawbRtlHCKSeJS7nZ56i9gyjayyN54bj+iS4JOhqw8JoixIUgS3hKvc2hVzx16
	uSIliUEDWWiToF+RzVSO1jMuwVIDvv5P9H8qVfgdW1buNogp5fWLhJeyr6Gp5Yg7hOKMLB1lV
X-Gm-Gg: ASbGncvhvC3TIy0LknvVxzyXGZ3kp8NrLaaHG3mXVLx3mYXOAKMc5dAnlqKoTtWVBD0
	K7zhUNOBWooi1Az0XnF/PTWQ9lGokZHDYHLqY5ACq3RTHGDNJo/gbPzKUMwrGFj//qkKbFxy/c8
	JADlkEVrGBQBl+C4uFIsWRiYvz4LvbjziP3iqA2ldZpGnR4kPKcWLYFWG5SmYDGCzLNavr5yEm2
	LZpAJWIFwZ4mlp+qUED2i6l/o4owM/yduephxH42D8Ooq55tLwNu8vFd3jgtf1Z+vEdnt530LJd
	hlbji3DhCqo4SI7y1r1yRG8c8hoJBXbHhUk1u/p3cjWEqFlJ
X-Received: by 2002:a17:903:258e:b0:22e:50e1:746 with SMTP id d9443c01a7336-231de370ec4mr146663995ad.36.1747676891029;
        Mon, 19 May 2025 10:48:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9IhBjayy6fKJrsILI/AjgXlo4kjWAqCWZJbGImLRI5GukGOA1+tI1EeTwEv6Rxm2rDl08PQ==
X-Received: by 2002:a17:903:258e:b0:22e:50e1:746 with SMTP id d9443c01a7336-231de370ec4mr146663775ad.36.1747676890682;
        Mon, 19 May 2025 10:48:10 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4afe8b0sm62651425ad.89.2025.05.19.10.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:48:10 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
        Steev Klimaszewski <steev@kali.org>,
        Clayton Craft <clayton@craftyguy.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
In-Reply-To: <20250321095219.19369-1-johan+linaro@kernel.org>
References: <20250321095219.19369-1-johan+linaro@kernel.org>
Subject: Re: [PATCH] wifi: ath12k: fix ring-buffer corruption
Message-Id: <174767688965.2567051.14391115791572763254.b4-ty@oss.qualcomm.com>
Date: Mon, 19 May 2025 10:48:09 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: ZPFkI0oaVgQB2O0syFze45OCiKUOMzbn
X-Proofpoint-ORIG-GUID: ZPFkI0oaVgQB2O0syFze45OCiKUOMzbn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE2NSBTYWx0ZWRfX6Lhhdiv130Gh
 nLfdo9B3Ov9/MxsB9FvHYaX7lpGeEdTRdn30MWglzqYz/eIMbTnvGhmOtgkYY67YRHLi31NSXhA
 kioxZtq2tn+kzOh7TwqOf+KNZNrDuSjaxwUwxglgoEW2BrZW4mZ99J7D4sT3cRbP0qgHGI7w2hl
 0tlCAUy1RkC7SFGl1hPNm0fGWU3+PmiELBXLWqy+RA2YB0JV6iI3pYJxjV9Emx/hkxb333rImgD
 NJi45SusCZ6y5/ZheDVZzBF32CtMG914ZHj5xoGXrJ2tNxlZcHsm/TMLJ0kUfzKJek8b4BCe4Tz
 BCV4NlJBU4SDSfA7sSn2P2ggOnxqvuXLPgUMjfaLlG1B7BoEUatXOKBFGQJcQHd6372tBRDtgQy
 dAtEC+8nE/89Sz2jnne/b2/v3NCKoJIrEra/RvkqojhfW/LHysEpWFoIrL4DYcZ0hWDzcnWC
X-Authority-Analysis: v=2.4 cv=RZeQC0tv c=1 sm=1 tr=0 ts=682b6edc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=R867-RJU_ElmTgWIOUYA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 mlxlogscore=717 malwarescore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_104812_587062_D8E5B84D 
X-CRM114-Status: UNSURE (   9.92  )
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


On Fri, 21 Mar 2025 10:52:19 +0100, Johan Hovold wrote:
> Users of the Lenovo ThinkPad X13s have reported that Wi-Fi sometimes
> breaks and the log fills up with errors like:
> 
>     ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1484, expected 1492
>     ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1460, expected 1484
> 
> which based on a quick look at the ath11k driver seemed to indicate some
> kind of ring-buffer corruption.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix ring-buffer corruption
      commit: 6b67d2cf14ea997061f61e9c8afd4e1c0f22acb9

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


