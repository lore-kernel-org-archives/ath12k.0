Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34343C3600C
	for <ath12k@archiver.kernel.org>; Thu,  3 Apr 2025 18:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zSzJzT/vvMpCdvsDvcyPFAkeAlYNVc0Lzm6ajjNU55c=; b=T2lfGjUMDYHuft7EUS/sdZENFG
	gyvz8XqlSnE8U9vTXRYkodi9z+RdYE+5648uJXOMmFXbazYFoP7V003SdKTUQkx1rEgQhw1CVjcGd
	ajt0C6PiAVhSGrhnlC6pCuDMDLkKLn1JhEyfHeYS1rXYzHPFY0Q7EEG9OVTaArWdSNseSnBsE5Icy
	dnpQPs6U4t7OxPclM73AWmGQaqrWHR1e/ZBgK1tlYVL5iEOp6+jtPLO4DMGqrB4eZxvcpiRvgHCdf
	v/VEK94nh3lS8AeSOnpTifkQUjeESG5yBKiQvX3spFEFLdmajtVdHefvmuCa4zZzCrgiPMfEWPSoH
	87kMoNPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Pfu-00000009cAl-3hNK
	for ath12k@archiver.kernel.org;
	Thu, 03 Apr 2025 18:52:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Pfs-00000009cAB-2K3Q
	for ath12k@lists.infradead.org;
	Thu, 03 Apr 2025 18:52:25 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533IUqsU000381
	for <ath12k@lists.infradead.org>; Thu, 3 Apr 2025 18:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zSzJzT/vvMpCdvsDvcyPFAkeAlYNVc0Lzm6ajjNU55c=; b=Ozb6fp08OrHB2H+x
	1kams8pZqzIoD7XhTaAm9qtpzm1ADkSm2WNxST9WO9V4UQKyE50F/8ABTaGb87v4
	Cm+ndZNHq966cL80tVtJ2gZGyMbmOe4aIvpVpfmOAHbGihXCPsb9mrjUmheLV1uS
	w1gfwz/eqaMpsf68cH25+OURsSsN5u6HnW6eHkDaBPMXLz2ELTWmrwvuZMIZofhy
	6QCJtabr/QvbjsUw+vHlLTII+fZa7yaG7tiMH5+DpRqUyzAvflXR1IK2dQRCt8GW
	tio7lpLXtSYca0QxdjRZXmAlY8EKM79fzftPrx8vvJ8knJgjMt2YcNSo9dBa5qcQ
	MQFsRg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45se4g2rw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 03 Apr 2025 18:52:22 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-af8d8e0689eso1334777a12.2
        for <ath12k@lists.infradead.org>; Thu, 03 Apr 2025 11:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743706341; x=1744311141;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zSzJzT/vvMpCdvsDvcyPFAkeAlYNVc0Lzm6ajjNU55c=;
        b=qXoY5h75qwUHdd2zdmBtTszJhQheCz9O1CQr0IlSv3UN4CVE6zqdjD+BVY2B06sn+H
         viCVcGkcn5+VyXd2FVWWUMmiZKS0JzCb1xOmZDi9MTbGjifzHBYAsug9PmQFYtAP77C1
         zgoRmAhCp+pLSCB66ffTAySulb3mie/0L1PvKIoJnJBnRbkicWE3H9T0WEOvD7H/BsWy
         ySiVUtPqjpoXqFWz/pVhRLzWwYyPl0pWbNQx9V2WRQ93IRvu3+2P4uvommQi1RKAU66b
         GiMpnOBe7ZwG1vn/OKQy4fv7PQvQkCsr+/L2CYRIHEZtnyuqyvHl1LkjraW6s36TeYPP
         I9cg==
X-Gm-Message-State: AOJu0YyYTzBoSyGflSXgcqbTjbpEtI7SbC/ZrOnBQdOLi1sLZjJzpjxX
	n9hn5CAaFKNHtpFJJSnxlQnTiv0JFXYo945KVD8GW3QUeDCyBKdpNTKEKoZ2GAfoCQZlftXNdl5
	pMkZlpGgd+9T/1/t0wmSgblZWD6rFz8yJr9U3BRAxzn8swGMw+DncZHi/StprUaTAivx3
X-Gm-Gg: ASbGnctchEKoaKlv4LU16hAsjCp8lf4LeCp0agqqgVUJx469UrGRBVsQY8BtWCbfyOV
	orxgJebrSiWkxSij1KKXcRjI6WYGzttgVRZkXzaWloY2nbAPo8db41aFIfDseHUBa4spKegokhC
	VIN2gaQLAupjBgk/s0xaNA+uIW0+un/43QtmUuznY/q9kIpu78L9xVvw/doPoNIkUgYM1ixp5f6
	upOd5rKTQ1C0uui2QDz9D6ZdHd9psOCGkL14gsH8R70Cmp4kaNyxcdHfi43l16lo2yg7KsmcU/e
	84b3wnFpcUq1i+fmPYUkl8AKFsDV59V10ThTDScOY+QirqRZN7ul
X-Received: by 2002:a17:902:dac7:b0:224:23be:c569 with SMTP id d9443c01a7336-22a8a861c6cmr971845ad.22.1743706341432;
        Thu, 03 Apr 2025 11:52:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHETG/rVqQmv33fIgHiV4j9KCCV1gn8O/DHCsOjNMagAhYoD0frYdMBkLnbU0XTWcQ7NaUsKw==
X-Received: by 2002:a17:902:dac7:b0:224:23be:c569 with SMTP id d9443c01a7336-22a8a861c6cmr971625ad.22.1743706341069;
        Thu, 03 Apr 2025 11:52:21 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229787776f8sm17927225ad.256.2025.04.03.11.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 11:52:20 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Nithyanantham Paramasivam <quic_nithp@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250402152529.1649402-1-quic_nithp@quicinc.com>
References: <20250402152529.1649402-1-quic_nithp@quicinc.com>
Subject: Re: [PATCH ath-next v4 0/3] wifi: ath12k: Enable REO queue lookup
 table on QCN9274
Message-Id: <174370634035.3124842.4515034622060851956.b4-ty@oss.qualcomm.com>
Date: Thu, 03 Apr 2025 11:52:20 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: TrL-twDWb3QhWJyGFk5ywwg2lqykFZdk
X-Authority-Analysis: v=2.4 cv=a8Iw9VSF c=1 sm=1 tr=0 ts=67eed8e6 cx=c_pps a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=PiDKsrsRxseamtqovsAA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: TrL-twDWb3QhWJyGFk5ywwg2lqykFZdk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_08,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 adultscore=0 phishscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=679 malwarescore=0 spamscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_115224_634393_4A254F81 
X-CRM114-Status: GOOD (  10.33  )
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


On Wed, 02 Apr 2025 20:55:26 +0530, Nithyanantham Paramasivam wrote:
> Instead of storing the REO queue address inside peer entries, REO
> hardware module prefers them to be stored in SRAM which could be
> directly accessed by REO using peer_ID/TID based Lookup table(LUT)
> mechanism. This feature is expected to improve stability by reduced
> interaction between host and firmware during both MLO and non-MLO
> operations.This feature is enabled only for the QCN9274, so it does
> not impact the WCN7850.
> 
> [...]

Applied, thanks!

[1/3] wifi: ath12k: Fix the enabling of REO queue lookup table feature
      commit: 0bbcd42b15fa730f393a01bc818802d9f0b04197
[2/3] wifi: ath12k: Add support to clear qdesc array in REO cache
      commit: 30b03edd265a79b779c29c12ad640c91830ce7ca
[3/3] wifi: ath12k: Enable REO queue lookup table feature on QCN9274
      commit: 89ac53e96217bd5525ee56eaa1b8ef2b398a9ad6

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


