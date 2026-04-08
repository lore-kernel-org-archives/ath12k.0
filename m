Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38980105D991
	for <ath12k@archiver.kernel.org>; Wed,  8 Apr 2026 00:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q/us5c8Z6txQt4vML8JPniKku7wXE456bDjUT+1dlC0=; b=3qnFN5wO4+dgmCQtFkzhSjDKbi
	zWXLskoClGV77OnhG3GZwKYl6muzxXNT9tTKkn8QIqk7kRLfQjxJ0Y5VruikL9dvxIO044p2Z7P55
	7PQyGQ/PARJdFCnudTqI9kB1J9sp97Jy/tPEfo0pUF8KLGpR4r9M416xauvnZB/5XHz0VhClL9JTu
	Zs0Qpbskl5zl5S/K3wqwEGFZ6eM/znmWMv5Szyu2VBBmkDj+IRKs3CAH3tS8/B5FSrG962T1tAw4j
	bxopQAYXLsOTQ3BCrxWns0oupL85UTzaM4jwrokEoQhXyJR5muM3lqbpCULtB3Htq7kdt86R1VAYy
	nokP5i3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAH7r-000000083RE-2sRK;
	Wed, 08 Apr 2026 00:50:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAH7n-000000083OO-1Wmj
	for ath12k@lists.infradead.org;
	Wed, 08 Apr 2026 00:50:32 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637Jlfbf1314245
	for <ath12k@lists.infradead.org>; Wed, 8 Apr 2026 00:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q/us5c8Z6txQt4vML8JPniKku7wXE456bDjUT+1dlC0=; b=WUi+BZ+1DX62WVt6
	BdsNSHMCboDKGj0SgOSuFAXFonkIS3o32RXWpFZtyIlm+iuhj1my2sLRMTV6CJA2
	sJXsdsTTHldTInDF/pZleIsqLJmUteKqjqbfqFvzED0VlzG0Bcdy62erZx+2mCSx
	rgqqkwzGwUKRWck3G5YDyD4J8BzNwIhwD1j1SDlyZiv9pAGyyuCWSpvOanuZSfa3
	3jr6+Wex2r6ijBF8lmTSCwD3ZzmiJssqGM3KtItuZr+arrtlz9pOMbvaj/wER+5U
	pkk/KWwv41aG9hQvnAVvFdC/F33ijcdfgJ2q/LjrrwBdc7QcXOYhqJniklVS+uKq
	FMyKjw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd8d6gqkh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 08 Apr 2026 00:50:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2bda35eab74so396190eec.0
        for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 17:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775609428; x=1776214228; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/us5c8Z6txQt4vML8JPniKku7wXE456bDjUT+1dlC0=;
        b=FxcK23WlkZD3Vd1rzplNQSn4YRw5j6HTMpuL7Nwrs+vQclAZqTxSXjmx0PqbhsjkUG
         vIKWhX1iKF5MclTudnI2O0xXh5X+N6lAGlOf94ifXGtYjDuyLiCUt+/MZLLjMvm71ebo
         Ww0SSeiZxmnEO+F73/10u/bQFRk+EdkUMPq3FK50Zxe8lvmPt7WQJhKLeabLWgAUANOb
         8CbZf8Qtck+dF+GTUh3YlepFwRNs9tl1CL5svbrmOI5q0JynusJK1XVRYaWiZQgSEeCA
         dquFzYBB1ty1WUXaxetIgrePaTkcb+vWbKLJ3bFlGSZ7eNZVYRccy5VN0adZQcMbV84U
         2fOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775609428; x=1776214228;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q/us5c8Z6txQt4vML8JPniKku7wXE456bDjUT+1dlC0=;
        b=Sk/ZT6feAEOGJN0oCjkC64J6pDHhaLDtRppDKx2PB3WiPKeGbC8NMmIEBH/ukz7oQW
         0jTZhvlI730sYNh2lS6GWgDKUiE3ZO/e7Plcvls1pQdcuKBQGwIRHnZnD6yRov0i9CMo
         SL1kZrIc4t9d5IeC1qTEUqoBW4xVqF5jGA1uIYvPcXdX6N5gQXonXvHC8PhByirx9sYe
         OMZTDxTvJ+YqVXsNt+iHdCl2kdFinxAaoA+dvafnT8E4KLsRVDP7+j6oFNAFH/O5lZso
         acCxAfdjwZcTM6wBImo7nESJv71QuNd4q4kJyTRrOHgwzkeePwyndmKgSqdY1wXLVM0c
         InwQ==
X-Gm-Message-State: AOJu0Yxdr1MRmv3JZXSvKk0/lu+I37I2IiOgdBEUgBCuBUEEFaiwFnSQ
	uO1hWHBSDLwlm15x/BDa/JDPqINvATUW9s9klAgilwdphOEL8uAFmjit8u0a6y5GHwNKeyILpw1
	EKzzO/f9IqiFUEqEKGDH8AUgqsS+UC45mmbzTnFnzkJSgVyU6nfc2gZtLA55Wcm+5
X-Gm-Gg: AeBDietgtqzuoAwz96n7hqWiKYEbKnxBdm+c1r1ipj32rvR89Sd7Bs5bY6dfFO7ShD2
	V2wN/hHmG4l7F3RIMK7S/yaNn1GPjrA/5/fblSml5A3a6D4N/hUsWWAGBUigngIZc4z2ocyY3Gp
	zMENzr9uJZ/DwEKHTRyqjLnUZuBVWeJBxunBOq5i8wDVcsLwYQWRkXM3QNI0/ldWACaJ6iFemQM
	S3GL+xI8njihTn0ctvVXJbE5Z+oLdNhryQoR4ghZ7aGGQGxeG/zsGa37rJLOUGcTJdWlFT8t86+
	OP+iO3kg/65GVkj1m8g/9iB3tUvcQ3cDgL1n5/L33WzYwhM6/ayQhjnEZ+Ng915q1+AAsSwGUHg
	lY5BIDYhqYrhxKex6slsipqoUE6zA/5iADmOznxHt9Jk2Znv4MlNYWdzWunMvBtU8WeGNsGzFv/
	dU
X-Received: by 2002:a05:7301:730d:b0:2d1:9b35:4edb with SMTP id 5a478bee46e88-2d19b4501aemr1574109eec.0.1775609427523;
        Tue, 07 Apr 2026 17:50:27 -0700 (PDT)
X-Received: by 2002:a05:7301:730d:b0:2d1:9b35:4edb with SMTP id 5a478bee46e88-2d19b4501aemr1574099eec.0.1775609426960;
        Tue, 07 Apr 2026 17:50:26 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d2d5409fd1sm1257301eec.13.2026.04.07.17.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 17:50:26 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
        Avula Sri Charan <quic_asrichar@quicinc.com>
In-Reply-To: <20260330040732.1847263-1-roopni.devanathan@oss.qualcomm.com>
References: <20260330040732.1847263-1-roopni.devanathan@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Skip adding inactive partner
 vdev info
Message-Id: <177560942608.2878209.17143932137054668382.b4-ty@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 17:50:26 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: VnTIZqj3k5dd11oWtMcTzQrKjxvzyU3G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDAwMyBTYWx0ZWRfX4zb+BRJ4K+7x
 baphEe+poMxOUkJnf0mspdwBTomDZVTCZiZ+QrtiacZHNck2dkWn5NLPum9cX/Tw60BFZrtxIO5
 6SOPNUh+ku3hHCwuJvJw9U3TqwQedEeLHDcRLM4JLYnVyl/tk8NCJ6Bltbw73RlgUDSplI7VRkt
 8yMI0U5I4tkVCEMBp+DweLYH7D3NxXa3p8wVoqXuqcLXBylJTuu8hu+CU+ugVyMBmCDR35rAhjF
 Pe+74P8WmCPjMTG/KNdgyBS1dVqEeD4xlobnVBzaprxCg3Ipn7QqQUgIAbx9YeyPBKWlJ669kHX
 6Vk4EfHZMIDq1IIjjdx8sdqtLoIhTDb+3uZ/HBlHWPBko79LV3Xol1eGYGCrYkuNgDinafwRwcR
 g+qla70cNpY/kv+gLdric9UvbM8uiBIo+lRqOBEVLByN2SHk520LLV2nigH5l8sPBRf5dYYz0em
 d0RxkvtCABpmehFwQvQ==
X-Authority-Analysis: v=2.4 cv=GN041ONK c=1 sm=1 tr=0 ts=69d5a654 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=T1yrVSn06Lq-3bePM1AA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: VnTIZqj3k5dd11oWtMcTzQrKjxvzyU3G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_05,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_175031_411789_4AF470E7 
X-CRM114-Status: GOOD (  10.76  )
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


On Mon, 30 Mar 2026 09:37:32 +0530, Roopni Devanathan wrote:
> Currently, a vdev that is created is considered active for partner link
> population. In case of an MLD station, non-associated link vdevs can be
> created but not started. Yet, they are added as partner links. This leads
> to the creation of stale FW partner entries which accumulate and cause
> assertions.
> 
> To resolve this issue, check if the vdev is started and operating on a
> chosen frequency, i.e., arvif->is_started, instead of checking if the vdev
> is created, i.e., arvif->is_created. This determines if the vdev is active
> or not and skips adding it as a partner link if it's inactive.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Skip adding inactive partner vdev info
      commit: 7d7dc26f72abb7a76abb4a68ebad75d5ab7b375e

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


