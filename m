Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C423FF8867
	for <ath12k@archiver.kernel.org>; Wed, 29 Apr 2026 14:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5geFPuppNEw0Na2cpguNPJGL4nGh1NRsp1YB6ryaOE8=; b=cAhM4jmKPXkVbpmS1fc34fZVpr
	wXDzBF4Hjjb/GcTUF+0gTnJv3/DnHL6S2D1JAYO+ZuUbsdn0R9Juo/DEU1AnxsaadaIHv3chuULQF
	j/hFtrcMkLIQwgie+1/tWwNw/g+Y9AH8wBeoP66lJmooSW2r0V+bU6eBaaN7HqiqzhQeVKnH9eqVR
	N7J0g4KKqAOpLVBl++RXQOYo2T3Xr9bAIOW6XQhF//fQsi8zd68E32yVoiQlXuns/gFTPKHjspeUM
	T9rLHlNgOoEniPt4zTy25E1omi98A3z1DT/6avmhQu8rMAvXzjr4figC+mRWY5xzxEOPZQ1s8pMmR
	nZucT4bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5XE-00000003jJw-0HMg;
	Wed, 29 Apr 2026 14:05:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI5X8-00000003jJB-35FK
	for ath12k@lists.infradead.org;
	Wed, 29 Apr 2026 14:05:03 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8q7An1721223
	for <ath12k@lists.infradead.org>; Wed, 29 Apr 2026 14:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5geFPuppNEw0Na2cpguNPJGL
	4nGh1NRsp1YB6ryaOE8=; b=UzklY3pEYefS+bOkeBxtQUZQD+IPj7gXWaOzbRS4
	WSH7uI1wuHaUtu4VHRYIMvEaC8Ce0Evo+1qCEfaXCuS5ZjOepwbErwHPT64k34un
	SbcLc4hz3Yyoroyb3gjlgim9TtWDtoikFNBW9OgPOx+e2y7su/Kq1/tXmPTWiAYZ
	LKsObFeI2pSfqRgSI6in7sI2towKK+tr48YfWNyZERAuT1Y+/k7VL9nPYI2Rm+MG
	rnEcZGfao2k8+8039tDSPeRRbTv/tEPjbLqp4NrDRL4nlwgeOh464GwL7tyN7NnV
	qY55lUizS1cK2Jl9wXKawsarLCHU2ioQmRBhk/Lcn91pGA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua732bcd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Apr 2026 14:04:57 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7ada7b25f0so3965369a12.2
        for <ath12k@lists.infradead.org>; Wed, 29 Apr 2026 07:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777471497; x=1778076297; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5geFPuppNEw0Na2cpguNPJGL4nGh1NRsp1YB6ryaOE8=;
        b=BEg4ExoDeVPpxrgy4NU4o5Vobf5VCOL13F0Yn9mRC4hbPsJzTDhmg7EZp+i+oGgPhA
         6Vr15VXQ1ybgHF58YWHvWQsuo+CDULTODq7IlAKmxzx64CEBwRiOXQMz5fxkJndVsDHO
         vgunOdinovurDvaQ9bVI4T9BYn0tmbCNWWmVlg1538Lv0sRNzdQrQxsZWigEbnPYeobR
         RtxIpgaJjYNDTyHz1uhKeLKF/MhtHO8mfwSvaPKgNwD2UdVm7+Co93YLaSs7mGcK9JkP
         uAC39EzFgSPK/in4d+MsFcnI22B1yWG2CTb4/VQ8LzkcNplhO8ZMahLGz/7+j0P/nDC7
         Lhhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777471497; x=1778076297;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5geFPuppNEw0Na2cpguNPJGL4nGh1NRsp1YB6ryaOE8=;
        b=SBlVulSfaoO/W2bldql6ze5DB/oyO62UlA4cCAOWnoWal91uPkuE+/GKAIwqGOpGDX
         gIAfjom6xRUC9BOyt9goUdK/GeQW2qaouif8TXxQ7Q2G1X63zwP+qmlfj53SKwKOFLMl
         G2pGAgLEMYAduCcM2t2pLDmeyqaA/T9y40Kl5Mp19MXYg/vxbL4YQZScvggnO7KMEamg
         gV3BZOIGd3REvWWxVtd/oCoRSskrzVqWH5wdYZNf+5DVAJdW55dif89IKMR+T/vNmNWu
         BvllA0uZh1ngGwcM0aXu3yPeJW9ASXK54n+DBfUWLCnyE2ovVYv06meSmIHtrgJvdwas
         Z9Ag==
X-Forwarded-Encrypted: i=1; AFNElJ/fatr5HEtZTUtb0VCnACcRjOdX8+RZ4f2VJHy5TPiiLwu7i6J7twNLIXr43ox1cEz1UHMedBc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzI+iXmXzGtW+WSLNbKn3kmi5VVUwzZV4/htJt5KiwBIMHCRXbO
	c5k+klnrKfasE8+LcJRAL4LVHlXoLXSpt7xfBMcXOlekEd3zIg2JJp7Yy5XWLHl/jf4M4cfd65a
	EXN7UyzBtMyx6P3g8cJ1+kgcvUkNhPdBous2IKxCC8pyRHuLFOguLIrZIYSvXEywD
X-Gm-Gg: AeBDieuXpcux1VxPTQIDbO3evZ3OczCdvqVoAn0J1JLjzo4N8Z1Acx2MAnsqsr0Fh89
	VUHoc6qll6UK61X0htgcZfQel6KOMA+Z2OHowHQfZofZBlvT+VYvlD/VVsc2dUa3eG3a5VNjy2q
	W8mE1XXU/einuh1ZNSO76a+KFKK1q04OhJUzbkPrXxSW/leKQYS9W62DCzPIvruESD6JCyk53G9
	gIXJuxm/HnoDFfcLzQSdh4rqA5R7Sh1U2P9iM/C2r/gk4WBNYokrEIBql9pTKmm/iEdX+SE5lhk
	2DmR4Ec68M9THaga6eJvv0Q8Amxq+XMcPDOAviknMgv4u52R378o0aWQ7tvms+L2EFT1Bi7utne
	aQauHVW4CBVE3fp9CZnoodj/txj88Zysw8nFNJJTijauWhNVYLmG2OXH5jWM=
X-Received: by 2002:a05:6a21:33a1:b0:3a0:cc67:396 with SMTP id adf61e73a8af0-3a39c2722a6mr9041382637.28.1777471496921;
        Wed, 29 Apr 2026 07:04:56 -0700 (PDT)
X-Received: by 2002:a05:6a21:33a1:b0:3a0:cc67:396 with SMTP id adf61e73a8af0-3a39c2722a6mr9041274637.28.1777471496127;
        Wed, 29 Apr 2026 07:04:56 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fd6506af1sm2270618a12.25.2026.04.29.07.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 07:04:55 -0700 (PDT)
Date: Wed, 29 Apr 2026 19:34:40 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v4 14/15] firmware: qcom_scm: Remove SCM PAS wrappers
Message-ID: <20260429140440.ov7x75bikyvs7w5y@hu-mojha-hyd.qualcomm.com>
References: <20260427095603.1157963-1-sumit.garg@kernel.org>
 <20260427095603.1157963-15-sumit.garg@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427095603.1157963-15-sumit.garg@kernel.org>
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f21009 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=n1VOVlC_Xzu4QXtT9DgA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE0MiBTYWx0ZWRfX1IeFR/lschSo
 LrJznjt050xIHVqbtMGGyVENCkoO2v2/N4a4MZpmzgQp3j/kxldj++Z6yVAZcpMJ/cvxJHW9F1e
 D8fQ1br9ytFXv3KELphncZLJAOXp9Yl9/xjx0FUlmpsemEy33ZUeZAjC/iths1qZ6x1YQ9qxn3f
 egvkxJf1+yDyfe2ZadTWp14gHvhbOace+LtNniMlLvmUTONaMOtqMAIcuxUBAsPjVz+goVduRLI
 bLBbb7xGhyFBmvUoUfszdYxNb/T2dx/UsxDY4rKwiY10v0jCnVKiL2k+pu2mPy6xmab1xry/dGN
 XOiWwq636FQTZngaVwvQJfnrRzm+5X/ZVWYIYyDPUmLl6RnK39/sONf1mKUvtmaM/t6g81S/tas
 byrWJPSvvOdGIEM5PG+W1wljrUja9wiw7MUOk+jjVO3swWDzFISCN4cHdTvogig7o051Vr9c+3y
 CI737UqgltCXRbI6RSw==
X-Proofpoint-GUID: PFfp5Dr7kZQlEwYkg07_JxI2NxxJmAga
X-Proofpoint-ORIG-GUID: PFfp5Dr7kZQlEwYkg07_JxI2NxxJmAga
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_070458_783894_74658FD7 
X-CRM114-Status: UNSURE (   9.36  )
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

On Mon, Apr 27, 2026 at 03:26:02PM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Now since all the Qcom SCM client drivers have been migrated over to
> generic PAS TZ service, let's drop the exported SCM PAS wrappers.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>


-- 
-Mukesh Ojha

