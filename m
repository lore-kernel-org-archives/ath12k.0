Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8E1D12668
	for <ath12k@archiver.kernel.org>; Tue,  2 Dec 2025 18:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sdAs0dnDIogQLGWCHgQe2HrkUPtRZeYZMCUBii0siA8=; b=wQtRU8SrhZF8+uT/oMgn1uieSi
	gXxBn8p/BXlpUrlyYU2CSFSPU8CjgAogUESs7am0LbiSOEMVtatrb8bkGK1ndD6swDeP+CLGo5yK+
	sSmzI1PF3qKB0SUTHK9GqSnAfQUeuKO2Q9Wv1iKhzIc8I5vBfG8Z70H1cO+xdl6xr21VY3D9cnTA8
	9YqVUhlskgB15E7e5LOBxuPCaGFQgzlfss+YxwjKiDJD8VicGmWDKsxA4sr4P2b7OXzLbskSm68t3
	v/nHuip8UEoN9TipgNTdA4ocU9zBPE3YOQ0Hr5FEmHBTK4VC3YUFXeDcn2qJ5k3bY7q/G0ECsiYGb
	2a2zMZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQUlm-00000005hN2-25mJ;
	Tue, 02 Dec 2025 18:06:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQUli-00000005hLk-3pT3
	for ath12k@lists.infradead.org;
	Tue, 02 Dec 2025 18:06:32 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2B5Api3311173
	for <ath12k@lists.infradead.org>; Tue, 2 Dec 2025 18:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sdAs0dnDIogQLGWCHgQe2H
	rkUPtRZeYZMCUBii0siA8=; b=DZ/W2OoGO+EwpgHVbDwKw1ewM8mFMu0Od7VBIg
	h4SVSP56eUYfq3Cm80ql0MZ+wjt7shMnC3aDAVq96OO79jwAID2ZpXPTZkrpF9oC
	gr+6OJvBeRUDYeqSaG27bNbgrZ/xBMgAMQqFTFZMNJDer6KvSZc783+9b63PIpif
	M9nplnu9Gy5YeeuKiVTWx37gemCmQ8XszFwyqip4HjV0GIYSxDtuQpv+d7PQPbDy
	hjjOsRC7gOmklFxwMbYjbysBl2E6a5jUouAT75LUeIFeo/NjH8WGVB78oS22jEl/
	EdEbEveYeoxwmt/4sl6Yk4EeLd18Uw61T0zckMA61KWQRnBQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asxwwhbsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 02 Dec 2025 18:06:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-343fb64cea6so10453093a91.3
        for <ath12k@lists.infradead.org>; Tue, 02 Dec 2025 10:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764698789; x=1765303589; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdAs0dnDIogQLGWCHgQe2HrkUPtRZeYZMCUBii0siA8=;
        b=At8okLzKkRyHEJjMJY5nGMKGLNIhne24HcZMamQFN2/x0aAoasJ3XWsBPvR6ErtVUg
         IkcchP1k9TbEJs0TA0vaDgDMKvsB0IevdkCFQCyllSugEuhwXBLBSxGsmlUtntujyyd9
         DmSe5NelDZodTt1lupgvp1D1RmJG2+mOKO1MXJmyoYEBInQOXi4P8IyvUchnkCGdXR8y
         2avCJ9SQy0Ed2UjyBNgFkSRiVPWod2wjGoUe6L9cm5FFvzznIuazY+vp5w8kao6i+zj5
         YC1RrA24+vO1bq7oEx7EqpEFbs5RuDXcUyTR2vsU7uH30rOhhdQHoA3LesI2sqrYbais
         2/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764698789; x=1765303589;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sdAs0dnDIogQLGWCHgQe2HrkUPtRZeYZMCUBii0siA8=;
        b=XDnOQsXnzComTigoopZGxNWhAGBdRHiss2iUZ2WlMJqVEcIqN+dAiZyFHQAMF56iaE
         H/LnvhpX/BXRNZJWL6nuspyJUYDBI5zc08wCakW7e0M/6qDbOIFGU7On+4yYMJmHfG1q
         pOZTAZRM3QImG5sD4bKtvvdy9ZGvonssra8TeRyaSyv8sxcqIHyX47oBL808TFeZ9MrR
         ioUFCb0Gmp5Zs7Sb8Xwb0gkyYyVabzJQ9hGn6yRipCxPz4wsxWHdTyzdR4Noxo3yWlSR
         CIOQquKbtieFDl/TA9fqJ0VS/ei46LUHyoVT4Mc5iHW0S0wizkkoeRWpsthmuRWsRGdJ
         cAPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXY9iVpkoLEHtMIt8rSg4SmbG41/IM4S4qyloe7iereUWQwtpXQs93WDG4ByPN6v3Mf/IUJAzI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9gAAvhsBHY2Rm574YeDPQg4c4AxDg/4GJHZajYad/v/6BKyld
	19+IoCN96Mftgmzcfg3AdGTxE21yLg3IhtKrUH0p3PcRFQISArwUCCeKv45nSXfupckuSZBKDnh
	Ig+bCXWN4P2u0Em/XaxiBlAr+oTlsm+8bugOI0R46UGQ+r4ClRN/WLpwEpgVfHa8Q
X-Gm-Gg: ASbGncuQtibbv7TMkyKpvd0epI911htwMFpRLDRosOcjC7nzMa/m0yRZqarpM9ZG2up
	Z/hSi9TSE+VEw1zvpWVp0ZKYUCFUBPUjYPjNUFuSq7TebIh0f1NHbmSXpgRwRNrF4AgiTx+RWh2
	xp+NUrzB7J6l/QcSEicRYZtCzzc4UYXP5dXEToHgUQwK9VmMKiyvvPqHoa3Lb74p0ll1YcasAC3
	x2ioj6pSmltBflHaVO482jt3SJqiv7MbmHcVpomWmyeDkBXlDVuWcmLiNscARJu0xsPnoyPK2U9
	3UqvruIuZShwHskI9I/fhQx3QVx199YZTFwbzcPZQcvtALo9MpXOfAzT/Csj9NJVQ/ADxoGT812
	ZTLjh6hrjqRJJjPA6u3SVDDGA2HnQHkTMsVMh88hURMNUoA==
X-Received: by 2002:a17:90b:4b45:b0:341:6164:c27d with SMTP id 98e67ed59e1d1-34910775f8fmr259204a91.3.1764698788535;
        Tue, 02 Dec 2025 10:06:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHd6+xbf2z4wsfu3GDzVS/La6L3U61jv3f7dxujiiHLeJ95eqqcLPHTONyg4VyfeA2+arbvgg==
X-Received: by 2002:a17:90b:4b45:b0:341:6164:c27d with SMTP id 98e67ed59e1d1-34910775f8fmr259180a91.3.1764698788018;
        Tue, 02 Dec 2025 10:06:28 -0800 (PST)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34910e9dadesm41153a91.13.2025.12.02.10.06.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 10:06:27 -0800 (PST)
Message-ID: <5d522aab-9ea7-46fc-8d46-00bd60bda496@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 10:05:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20251202
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JbyxbEKV c=1 sm=1 tr=0 ts=692f2aa5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=rMWBp-HL3mJ3BiuJKzMA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 5NJ_3F8hl-QJbaoDd0vuMOUxLa5Di_IJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDE0NCBTYWx0ZWRfX26qXhnZNyn2K
 HdbYZntcBr0PkVCFF8bYiS9b7CG/ZhLmnZvmVNybsM+cy4W8844b1jikAE1HWLlMyFYNPAG5kl3
 fJdtO0wbVzpMsyvM8JI/kXPucKfy0Dz7GW9RqeAv9W6dK0Rv85Jblyv/PVmc02W8sTIcIbLkZJk
 uyyico5k44noqQQAzIEcmdOuop89MJj+CBMUxmQI3D3fta0RB1FfZoz2HLUA9lYYFKGc52M0Mzd
 sTQXJ3sSbp2LGOsZS+S/iXK10b3eDkizSi9LKjq1d5MHGt97Tx73O1+GWOPPEWjx+h+IPm8JCqz
 SbOiTQaNZen8JzRyFZqMNdpXA0uCxo0CdCUcJL3vUwFc0GONVYy5ganPqRwMzXphJko3g3nmHz8
 D2O2/eQixc4J0kBM67Qzy3ok8zd5sA==
X-Proofpoint-GUID: 5NJ_3F8hl-QJbaoDd0vuMOUxLa5Di_IJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_100631_080052_D7E19E6D 
X-CRM114-Status: GOOD (  11.08  )
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

Hi,
Here's a new pull request for ath10k, ath11k and ath12k.

Only ath11k is included this cycle.

Update the board file for two QCA2066 platforms, and update the firmware for
QCA6698AQ to enable CSI/CFR reporting functionality for IOT products.

Please let me know if there are any problems.

Thanks,
/jeff


The following changes since commit 38c82f07a964e27c3e71224c1f038a4083ff58b0:

  Merge branch 'robot/pr-0-1764573234' into 'main' (2025-12-02 00:54:05 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20251202

for you to fetch changes up to 15f8543684412387ebfc97a4b99ecd18afdc5e0c:

  ath11k: QCA6698AQ hw2.1: update to WLAN.HSP.1.1-04866-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1 (2025-12-02 09:53:54 -0800)

----------------------------------------------------------------
Jeff Johnson (2):
      ath11k: QCA2066 hw2.1: update board-2.bin
      ath11k: QCA6698AQ hw2.1: update to WLAN.HSP.1.1-04866-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

 WHENCE                           |   2 +-
 ath11k/QCA2066/hw2.1/board-2.bin | Bin 745408 -> 745440 bytes
 ath11k/QCA6698AQ/hw2.1/amss.bin  | Bin 5005312 -> 5083136 bytes
 ath11k/QCA6698AQ/hw2.1/m3.bin    | Bin 266684 -> 266684 bytes
 4 files changed, 1 insertion(+), 1 deletion(-)

