Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36541606A319
	for <ath12k@archiver.kernel.org>; Thu, 22 Oct 2026 13:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qJ4N/X8Z;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hgt70RvM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P+sGO725
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gkY7Y4DjvnNmO/ZlTSRgQGMjCbpBS/LmwUy05Hrmoa0=; b=qJ4N/X8ZeRILEP
	1iY3C98sbZrwHq0dvq6sVCQcNRI5no8Bc/dKgkfnmHuGDpYACcgdxhHTwZZ1zr05PTU4pqLBrivEE
	W9ChjpFPqGuK19yi27CpvcGFVpkUnkFlk+voHgPbRgNpKdhWLnNIw+I0XHu0RevLw4buM2FYxXtHC
	3mxW7q6ckymZ4CvsRfcycAeEGWH7BAqeVsls34OlzIUDLYnOGt57wOqGieP/jLLqFm2yuoGjL19GX
	5HWY35PA9YxQlEZkzOmM7hWu2AsMV4NHNWQxOJa1JXHcJ5zFksWIZ+BJNr0f6YBWiu1vt4055Sy9g
	5pRXMAVuobjLDcPMmT3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsyI-0000000EDSc-0dDI;
	Thu, 22 Oct 2026 13:36:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsyF-0000000EDS4-321z
	for ath12k@lists.infradead.org;
	Thu, 22 Oct 2026 13:36:41 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA06Ou3115553
	for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 13:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gkY7Y4DjvnNmO/ZlTSRgQGMjCbpBS/LmwUy05Hrmoa0=; b=Hgt70RvM6cP2PUNc
	YPVoHHeq9HEi5M/v1a2T5rhWvuAjUFE0Z29TrKfR5DH8jjq2KZFCxM9qEy4oOZNV
	SeXFODhqJLwBdhVSDb8FiqkjgQ2DkBQDfDF7Ird5FZRZpoo9o6EG6+el06hdL0k7
	liKJ4PtVsjOft9dQFFtVAYTAAJLrKowON6fmJYK2pRx7EG5wYPiQU0A+KKqhou04
	t4l6oORDjqaT9Na+HreEccZLE3HVM2BmRz27tre3hduRsX9NVZ1fUJ0I67v+anvF
	RgiMSSvH7Vo3BvoSPwEFOkR1WKAAYSfSAt4ioXuGeccaGakbswJCZ2ddsiIqXoGP
	AzVzrw==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93buuqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 13:36:38 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4f4612a1a5cso1123209b6e.0
        for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 06:36:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792676198; cv=none;
        d=google.com; s=arc-20260327;
        b=gOaXoojN23ASYfr4YkWVxXemN9CFrukSAb8uI0L7mjxNi7VRPj693NhvndRel4MkoE
         p9M8aO2Ca2ozgIeosaG6lXQbI/ndgZf1YTuiblnBHhGFFy0S26L1cQMv5B5dJCMQ+5kb
         8VZF0C/aPiXaXfsKlCC0cCUm92bBoetDt1EPGaEEigiF7IoqFeAMn6qwExaAlffs/4/P
         TrU25Ykr8L2XwgiLmawkKzvjAWfpLr0XizE//rR+4g38Mw/aK9+CLWt5A1da3rIh/mwn
         b2rpHLlkMNX/pTJohM45mGn7kP89HiprARcZFVgdpm6YYUhT5sSCWG2XNQfAoUOLtBxQ
         OMAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gkY7Y4DjvnNmO/ZlTSRgQGMjCbpBS/LmwUy05Hrmoa0=;
        fh=73tstu7x0tfglnBHA9dtAnpM0uAF2JV+AWnhF6+ID6E=;
        b=fT9z87A/gn/4QPbGwN1OXdOxgaDn3Tg0rVK2gsW0UMU//KKbjxF3C9BKlIdo5/kHiS
         RYJGwYlVTg7fJtQhD1E2oe4sxGPQl2aKs6HkG8ORn1duBgTYxIWa2sMYFzQnjSb6PcLC
         xSrLPveoxn0GEgACp60bNYLFfYYp89/eP7J1qJbaQUEz/QRdjC4HU6xjyiiRBk96Nxco
         QrcGg4ozjnLKPdScW5nuTQsrkU3/E0yDC0gqzjo79ChK67VCMUiM9hNvlkTLJkkQ4T0s
         LJiRpbS1su43N/hm+ohWwRQBi1xm65YlQL6MXKH/yJoRiUhTf/XwmwgKZipv8iWZ+wW7
         sWOQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792676198; x=1793280998; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gkY7Y4DjvnNmO/ZlTSRgQGMjCbpBS/LmwUy05Hrmoa0=;
        b=P+sGO725+jYWVX5wSHqgofJITnRIJkzDnptRBA+8pwhppZYPmwhTde4WqgaoWa3jxn
         nY7FkbPmvjCAEcN556ZCTx49sgmeIscyJBoPodp6HmxGtRDU7w2GtlVS51bcI0Btd53I
         xFeVT/K9KNZpZxspcfUkLwTCNS+xE8M+cFR/w8nSHFSIc6lWKjpBy6RLBBdJKu6AWh5L
         ArExq20Z2vL9G7T+y5a5yZMQDgHBv+pRqgQfpKnOBdu+3tHfbHQ4gTNfxM9wc63y7+FT
         Q3jzyJoLpw/4JofV6I5xjVRJIp8/xvr5OTXWvmQwoXzm+nzmgAcptBYc2jBLKV9rMMmo
         CvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792676198; x=1793280998;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gkY7Y4DjvnNmO/ZlTSRgQGMjCbpBS/LmwUy05Hrmoa0=;
        b=VakFmN3QAU3c3wRLaW7v2nouUg8zFLpPoLsOYREqa3wc74I9jas1u8RDwo8pAxgvup
         eMxnEHEWCqL3dJ/jJkLpoCxT8BVR20fwGXiexrXILx6i0iXWBrvfiSVCJqtcFE1+KUVE
         l3Y0jRzMYy58SVi+cijaIDzMTunZsvnKiuEkuPwm9ohqsMRdNv01eqoUU8gJBN5SQxfa
         MfaFtpM6aT1sp+FRkydBv+tNqJmcxQ/ihp9yl/kRmIBozIzF5EdZ/M9/RcLR4ZM9f8c5
         XBjXQ46GLUdGItsOR3/JjKo2nnGq478+bIQ1Dr49Xz5s4f57GQwYvZDkBMR2NEjFNLwb
         cS3A==
X-Gm-Message-State: AFq9FYL1yLXUg9GLkSaanaN7N1Cxijnt7grwBYXj0VVZownWNRf9yFRA
	gzpBPBifCkjDlW1vdlFYGJf4pjAFbWuKKJ/vIhxZbdgS0s9uTfHsv3PPtTjeLNpkki7TmNlclH1
	E7WIZLNRM7HWjR5fbyFYOrQ+FYBMuDcoCFZDeEll+c50NgmE2EeSX/xxgdX1RLwojWFWZL4ZXX9
	8NPmqZktesOYe6Lf27n849nvWYrIs7iIEN18A9XlUr8wrDPdFoxk7I
X-Gm-Gg: AYBFou2bXZr5s5x/Nh3aXf/eNVTHpYrKmtwVequjX7uFt7/2CjYRUmBew0xe03ZSbeR
	V4ewNSoXYFlyFc10TimQ8ZqkeyEvx3UWzejgToN80o4GPaBnaC2kDMi7iEA5isw82k29hHAj055
	AfYfXdtqQreXKt9qu3k4zdKnR+oaiYrQZVbtAz/Wy0Mn3jSOBSzJloN0V8zMrkGb1j8J5WU6VYX
	AzRzc+b/KIO3TBfuERaaBkXeMSIjCBXqtXJ79bVZFo2G+kw+FEwZA4mEhnrWiXTr+TMNoqYDWE=
X-Received: by 2002:a05:6808:c2f9:b0:539:c33c:769d with SMTP id 5614622812f47-557edbfdecemr1425352b6e.34.1792676197883;
        Thu, 22 Oct 2026 06:36:37 -0700 (PDT)
X-Received: by 2002:a05:6808:c2f9:b0:539:c33c:769d with SMTP id
 5614622812f47-557edbfdecemr1425338b6e.34.1792676197425; Thu, 22 Oct 2026
 06:36:37 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <c59e5c8a-7689-0c10-d64a-0aef882069fe@candelatech.com>
In-Reply-To: <c59e5c8a-7689-0c10-d64a-0aef882069fe@candelatech.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 15:36:26 +0200
X-Gm-Features: AclHuK973D9Fare1P0cnC-ScD9ptlNHoxQjcJK0BCgDaAFkBqIAXehjZmjLZ-bI
Message-ID: <CAFEp6-2ff-o+mFwuVY2b38Z7XLvfsT3Y=WiSosc4TqwVP7dgLw@mail.gmail.com>
Subject: Re: ath12k Bug report mailing list?
To: Ben Greear <greearb@candelatech.com>
Cc: ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1NCBTYWx0ZWRfX6EQOTloCy3r/
 j1rsIBOUu/ge6U/6x1dRgGCTBr8FwwqBoCo1yDQBHzolvakP/48O+t5So3Ih1cDi63AQLnVYpqY
 S+DpI0uzyh7AaA8OIzYAO2nliCRdcYU=
X-Proofpoint-GUID: CcvHr_Aprm-xNrh-SEris4iP8MT39Z1N
X-Proofpoint-ORIG-GUID: CcvHr_Aprm-xNrh-SEris4iP8MT39Z1N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1NCBTYWx0ZWRfX5Cs/PBsoT3rg
 IyaaNdeTNq8BvYueyiqL+QmZUrtfvdhhH04eWIgqCRzSMCnkMHaTmNAVvOyS3QjMFn3kolmytRI
 67U+3mZLXFJm9vBXkOxFo1zO6gVgp9QZlSv2bzKNc25TgdacdngIuu9kDmJyQ6ytTP3nXvH9Djg
 1nqvSYbJjKtjdkCre/9vnJNrD7wC6BkhjWFWzHZNI6Ni/51rxKseNLfzQBE1VPh3JeAGwszJKHX
 avuQ2/GEGNw1JWSknKoKgef1JQJyJBcjmc1oPLzGyvQ78BmvrOz6o7ygP1NDx6sBvkrPB1Zf3wl
 cL67dDVaW9rZgujI2woWvlGOy5qU3O+XsNmmFpThiHt1GCX2P+mVTJNTh/NpLYKKnKgmd0Kf0Ch
 9r7HRqkhHuF1zBheTO79Vf35NIfgCA==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ada1166 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=uYVGJH5IAAAA:8
 a=rV7FSzJn8J2J6Da6IooA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
 a=ZkEWZNUrOYKkpCLSUeX7:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_063639_873316_9101C1D1 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ben,

On Wed, Oct 21, 2026 at 7:55=E2=80=AFPM Ben Greear <greearb@candelatech.com=
> wrote:
>
> Hello,
>
> For bug reports related to ath12k wifi-7, is this the preferred mailing l=
ist,
> or should it go to linux-wireless, or somewhere else?

Bugzilla is a better place I think:
https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath12k/bugrepor=
t.html

Regards,
Loic

