Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F1AC87FDA
	for <ath12k@archiver.kernel.org>; Thu,  7 Aug 2025 21:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c0YZ3YLLvJK2KdMo7JoUScJunUE/MEJzmwquZliu5aQ=; b=hukZVYP2Xcbf4npNblbs2/mZvQ
	NBTDk8cSt76MXhSc6isXqb6GsPF7GjothUilvN1KTgUdk96cPddsOhDYmj8LmUE3MReE72kfCBm+3
	3Fy0oee7R/CSBK3BG0cfeVPSnTDKGcC6Pt3+t2baFbzPQerwOCyR++fsTsV/TVU/r8C/LRdYJfmEU
	KU0p9SlsiYGYroyovTOmUfhiKHCEVl7IPsgc9MlsJSs7cOTnOWIwEwLnInzpmtEWBtz5qp44f+WZ3
	X2UkCccl9o0CagvMCrY9OIMRceUPbBrsBbkUMbtGsQVFmAAw9+fpCrYxE9vjKjVvDIAlwrLmsH3Qs
	PHpcN01g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk8Ot-00000001Zrf-0onD;
	Thu, 07 Aug 2025 21:43:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk8Or-00000001Zqu-1xSp
	for ath12k@lists.infradead.org;
	Thu, 07 Aug 2025 21:43:50 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 577IBr1A003594
	for <ath12k@lists.infradead.org>; Thu, 7 Aug 2025 21:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=c0YZ3YLLvJK2KdMo7JoUSc
	JunUE/MEJzmwquZliu5aQ=; b=AqxKqiotMaKj+4zPmQwOMwJzOt7NovA+3yERsn
	2jguwNczw02rJtEEJde29DyHMD0mAuCqxP+u1ExQzuw5QRHKwAoceNOTKTDIt+UR
	uR3vooaoJwNdCknLTzfdz9xYKvAo5A6Q7i/b0YSldKWxcZy7G90yxCv9AvfXCmaf
	pV5F0gquaG7oBzieAjEVCCx3oVwoHxlTQZEybgegEbnEI5//nwKedhV/HRoSji+2
	qMzei8F3g0VPqkLRNNTlt+nqpQgLPQ/+GZrOgwg/MQo1037oQdyiyodmQhfEtIoM
	ReYSeJyPcaPY7fwFmS1y6ag2RsWqie+3c+E2rBAbd8OQEsuw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpyafsvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 07 Aug 2025 21:43:47 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b421892319cso1136474a12.1
        for <ath12k@lists.infradead.org>; Thu, 07 Aug 2025 14:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754603027; x=1755207827;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c0YZ3YLLvJK2KdMo7JoUScJunUE/MEJzmwquZliu5aQ=;
        b=xOzdrJGIGtjyWVzbPJDqYC7lltZyo+eQsTOK6YlI+8jVD3DN9cZwyn4F7maKU2xHw1
         Sj6VF4kYUiRZW5LXj20QQP+WjaQm2ujystbXWzj2cfJYHVYqfTsDJntvuyRmHYd0uEN6
         r9KO07v+Oc83E00uCv8GB367F0KwU82kYEMsPZ50ivaylR8Z71AAK4T4CGdH16nRQSDm
         itfjcXTH3MBW2zzAkQ9NHZEF3Ir8+H8YMHrCFL3MBPCtnTmw+eBnv6oU1visgvajxLds
         14S7i9O/9nAaUWqnFhzsddK6MKir1YCN3w1sgraEnT+mj/SyjYbgGnyH4yPRCGn2wMeo
         oNhg==
X-Forwarded-Encrypted: i=1; AJvYcCVdmotsyLlRxGcWQflZCl1mEdAzBpoZHKwP2DAtmeSBoUwLj4vp7W1MRQEdBZTg5kfmS5MggrU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzydZngMQcFRpgVq0/Kwk8/xwO6+63xwr8TaiGey3lpcPztVvkX
	50fqJ6yycWIn/XcgcvV9Ezkv91TGd2BHP1++22saVfJb6pE9u7ljI/jRUb5fvH79LEej3v3WKC/
	AgUK/444Z3nZIhbqIj2OeNo7rJXWu1vZcHmQik4MiMeJrg/k/0X7GgTTFCDxDVnh6
X-Gm-Gg: ASbGncsWWixbbsgKVQLwGGuyRADhbTbD3bBrxS3kBTBntOeyvec7XBjNpuVFq7M8Smm
	KMGIoYtggKybCwFIN5/RLEREEk0dKhZidGvqCowBZ8vEjz90hfLAa7XZglqiD+MCqvmtAaLNeQm
	C0PMF6D2IG1I+11p6J/Rws6UfmM3me6PPPDB4t8uq1w8/lbuZEiovbgO9wJUbVIIOcwu7lIqI5h
	E1YAP22ssfPwekdcZl+OV92oqjwAKjCPsot4wGE5PX2Gm/AnRN4++lvolB/jDLER8uWDGqT+iMM
	vw28BtP90VbYRcI9mGvWYsLfQ18kQ8Sk7I+9Nlzsoyba6hnWKSJy3txCeteLipLtlqmI0NOOgOL
	O
X-Received: by 2002:a17:903:3583:b0:242:8a45:a95e with SMTP id d9443c01a7336-242c203d43cmr8131695ad.15.1754603026839;
        Thu, 07 Aug 2025 14:43:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFN6v2dbx8Buiz9mLDddezvlVyeMzN2wDlRLGfDM+oXmOvFCIoQRzS8Xs7yecMOzsLJVhDisg==
X-Received: by 2002:a17:903:3583:b0:242:8a45:a95e with SMTP id d9443c01a7336-242c203d43cmr8131495ad.15.1754603026374;
        Thu, 07 Aug 2025 14:43:46 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899a917sm195015435ad.116.2025.08.07.14.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 14:43:45 -0700 (PDT)
Message-ID: <6e3e8199-814d-4969-a951-d6b60f60257d@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 14:43:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath11k and ath12k firmware ath-20250807
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: u_9rtycUVzGqdvAXeCbBtMoV1cBAQ7F8
X-Authority-Analysis: v=2.4 cv=MrlS63ae c=1 sm=1 tr=0 ts=68951e13 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=8Juthw4_Jig8fID-B6sA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX0D95dmhPB3F3
 Fa2YsJWW8vX5QAhzB3QlrJ1MPpQA3bdkywfmtLY8WkBA04gcZlxmdCXunyMIR2/h9T6mJjCw4lo
 NUuMmGCB6cyDAPPH+fPSJB4FEUYknN1paP0tz2/0PskMsp+nhP2EE9kZCrseyI9do2XKc5ooeO6
 lyAdSRnthTnyeiX3O8wPCcszOd1AxfqTe+XqfPegJnFmK+SmKRz2UuYrqztCNKCvZQM5/g6Mtlz
 xgLiNYtG1zhB0TAtWLHEPkzls7LVlaWvFJNwzFJc8Pmz3VtyJarjOSOJFBJ8vOar1G82sF1JV3n
 5uOIzbZeUz53/1W5mopchhTIVaH06/23zrDFSsf2IF8KWWKsTAm/acoJiFnjnStCWYEXvGEOj+d
 M6JD8+Qs
X-Proofpoint-GUID: u_9rtycUVzGqdvAXeCbBtMoV1cBAQ7F8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_144349_523330_44FF7E37 
X-CRM114-Status: UNSURE (   8.27  )
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

The following changes since commit d30c7b425f6d9c9e9f54bcafa99b375342b3a774:

  Merge branch 'robot/pr-22-1754588181' into 'main' (2025-08-07 17:52:32 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20250807

for you to fetch changes up to 35abebaa15c1ff1a141b7c24d79220ef70f48548:

  ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3 (2025-08-07 14:32:02 -0700)

----------------------------------------------------------------
Jeff Johnson (6):
      ath11k: QCA2066 hw2.1: update board-2.bin
      ath11k: QCA2066 hw2.1: update to WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.9
      ath11k: QCA6698AQ hw2.1: update to WLAN.HSP.1.1-04650-QCAHSPSWPL_V1_V2_SILICONZ_IOE-2
      ath11k: WCN6855 hw2.0: update board-2.bin
      ath12k: QCN9274 hw2.0: update to WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
      ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

 WHENCE                              |   8 ++++----
 ath11k/QCA2066/hw2.1/amss.bin       | Bin 5349376 -> 5349376 bytes
 ath11k/QCA2066/hw2.1/board-2.bin    | Bin 685144 -> 745408 bytes
 ath11k/QCA6698AQ/hw2.1/amss.bin     | Bin 5140480 -> 5005312 bytes
 ath11k/WCN6855/hw2.0/board-2.bin    | Bin 6429240 -> 7056532 bytes
 ath12k/QCN9274/hw2.0/firmware-2.bin | Bin 15392824 -> 15183928 bytes
 ath12k/WCN7850/hw2.0/amss.bin       | Bin 6078528 -> 6082624 bytes
 7 files changed, 4 insertions(+), 4 deletions(-)

