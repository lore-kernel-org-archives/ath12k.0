Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D18F1C624D2
	for <ath12k@archiver.kernel.org>; Tue,  1 Sep 2026 12:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMw1bZsyl/wsw6eXPmwKbIq6QdTazM6/t3F4X+WUBco=; b=nnsRv9ivWv2DGqP3kPf/wAPTpr
	dmQWsKA9Z8risgrU4cxy9EYvoEnmT3Yt3QER2+18OawHfW10dO2d3TMWqr6IhS5vcE4SzZBsB8pp1
	DEfnwJe6c6FMCkvhCf9ee/iWfqHySYLktQ4cdSeUa/ypaPwLUj2P5OfIpTcEwg94Erius03Ylny0q
	Hk+ljQOv9+fUZRPbB1XU1nBOGSpj2JV5B3f8XwMHO6kSoOTT/Sv2pAxuaDfx5FKZ0UX8E2ccAYBhK
	KVVVZ34tGrL5xCPHLZB4lfD68Ka4axNQtzh62O27ePFGb18oEeCfygLKmlG8DCidUIBw3Ey7/2BaE
	3har5XYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1NgN-0000000C7IN-2Hat;
	Tue, 01 Sep 2026 12:33:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1NgL-0000000C7HB-0lJM
	for ath12k@lists.infradead.org;
	Tue, 01 Sep 2026 12:33:42 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJJnO1136749
	for <ath12k@lists.infradead.org>; Tue, 1 Sep 2026 12:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hMw1bZsyl/wsw6eXPmwKbIq6
	QdTazM6/t3F4X+WUBco=; b=eWjZsGYAZj8O5JUmFfCnYfRbww3oq3NlVlYWZXS1
	cqUsAhlg3HoZjGzoS4YlzLMgF1qH2BofiuocRfwAFFr3Y89bl5dAgkfB9TEwQAlg
	Yfykf0OjnTmoOKrma0qRTi6uKbpqgHIeeT6QcbN3bKXM/IbnA46+RaZSGloloi5s
	kwl/tWFfr3cHUXJ2CgyXJEU7fM/+8KmWY2LJrjaUvJ8fs3l+LKcjcMSVTQTJQleL
	63qY5ZqmFHMuDZFEU3nOSQvkU+whOZ0Zc9y4DoJvn8CbQj20Gs2J+0pGlPG7heoT
	cQIrBuS0MhrVaGhwS3xy+kwceHv0oAitHo8EpaPNr/9sNg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcshu9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 01 Sep 2026 12:33:39 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90e98e74535so9421046d6.1
        for <ath12k@lists.infradead.org>; Tue, 01 Sep 2026 05:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788266019; x=1788870819; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hMw1bZsyl/wsw6eXPmwKbIq6QdTazM6/t3F4X+WUBco=;
        b=ShcPpkxOZ+tXB6doqYDMOZf0O240v4+XnQb53/KTxjLjnTEuTU+Y1L0JLuUFRns3Xb
         hzCeLkA4moW0rnYwQquzkFuHiK0Cn1Ajga8BkBbNWaPon079WXIkS5B0rVm7f+f4mNn1
         H/n5Fhd6TSxCHws5HAe8dQEgOO93whFxnuvlgIRIx6IM4iEn7qZVuuk9H7Ws3v3sFl5+
         nGUNjM2QSVT360hn7hsiyVgzb2ElqVuH+7/clPeFFk2/zuGN60KrcOwnDUoKkj9NDJca
         m8jcglB6nYC3zEBLcuQdCGbvTbHXHswBdF02CeWtJLiTIt+qrW5t4sE8KLWjmEIfPLfy
         ISkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788266019; x=1788870819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hMw1bZsyl/wsw6eXPmwKbIq6QdTazM6/t3F4X+WUBco=;
        b=fxhMTafgqG3CnhZbpFdTTAWYpCcLgKM3AnfKAFcFGOlrcH+UHM6pRPqzdtuWJPiZCr
         Aru9oY5wwd0NMLqdt2cc7vvsgXsJCRkwtTssYmf3t3YdAW9gwQUALtNsDxAyH3hQ+Ev8
         O9u6CMwioG1kmrVIrFLwYt11hefEnaz/Qy+182cq7PHeOQgjXXqluesyoAK5YsHtCiby
         gqDR7w2MYCcDttTrC1STztk1AlHZd7gfGHYTytsypa+Js3CVttZBfObf8VVo1r72GSr9
         6f1d1e7GKUY3hmyz7E7SYM/bEpbFEEmxoysNOg6S+0eoXXM6fRHeRYLTjr5AOplyg4t/
         Eseg==
X-Forwarded-Encrypted: i=1; AKwUvByiH0jzvnbyYQi0fNrVH9CsPboMq64BX5JQkax3WpFdZVfktI/oi1npuqZFSGVsqgSBi15g6nA=@lists.infradead.org
X-Gm-Message-State: AFuF++nOUFuuHvFwn8Ifk4TuooxgDVz/Xc+rRFSTINXXnNSy5PmAUkBa
	boyw2WSlkV85QyY4urJ0m/ue2xMMBDVYbpJGWJl4CEPlvXkdP9tLtbGBp6t0gASni/njFrPGEke
	RUeeLhWUB/Hih1jkJMt+PqQn8vcN97jTHxtMlwgjTZrwS0aQdsqDZN1VEwoYnz4jV
X-Gm-Gg: AYBFou01QslXs9gH1unjWBoxWwXKgDxhJZbjLjmXJCkhKcE0ZO/ddOpltfMMy7HpQoL
	fh7YbWRBLy39NTaTjOfdqc4Dq7zKHrYsvSDSwwvBtHC1XzuuekyJA0y94d5UMWOU+sQZTjwXZPO
	egH3QJCyq8vHsOzX7WE71RwiE/xuAer+sYEsm6U0pYUYor0Inyj5zHSirIKezAfduhR2rGEYuTA
	wcikiNzuU3WZuqfUvz9B56dUzrxXrxx9F5afpHdz5W1JBNkwrrd5sMxrLI+onfrf8Xp7wdTDaUC
	4LZl5Ar/hvCb/ml/ZADU/ND+xM0ZknaQ/O8SK1S1r0Y7H/u1iyfwEb6cz0PhXWtW3nRz1ATWWSR
	7MTpMt9VMC20UqxD8erwZJTgnEi4s1IvTuOt/6CHfcDCYW7ghfqoC1D45DmEhBP02wjWw37MCwz
	+WfU/EEkkYLNTR
X-Received: by 2002:a05:6214:4908:b0:90e:976d:fd2e with SMTP id 6a1803df08f44-90e976dfd5emr49205816d6.13.1788266018600;
        Tue, 01 Sep 2026 05:33:38 -0700 (PDT)
X-Received: by 2002:a05:6214:4908:b0:90e:976d:fd2e with SMTP id 6a1803df08f44-90e976dfd5emr49204746d6.13.1788266018042;
        Tue, 01 Sep 2026 05:33:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a31e5fc6f7sm16578891fa.16.2026.09.01.05.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:33:36 -0700 (PDT)
Date: Tue, 1 Sep 2026 15:33:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260831
Message-ID: <lh3sniuz6oxovkjdhdrjmjmoczjx5y5gnxfv3lteq3tpmjvwpr@x2n7qbbeqnnk>
References: <a1b69517-a18c-49ba-8ef3-9b5de089eba5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1b69517-a18c-49ba-8ef3-9b5de089eba5@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExMSBTYWx0ZWRfX7MYojhCPGc3E
 Zhj96q04KERUGqAwhbxEtt111zlH4khNZ6FAlR8f2zw4K+1GckPcT8d1H4sZhvG61o51sJwV1iH
 mmszN5YT1Kd9WRvEa2if1Aq+euvh3a0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExMSBTYWx0ZWRfX1sYDEieiCXbL
 XBBo3X5VXZZPgyCRQtwDRi/cvOpZkcbjw7JrTHQlEI+qNCt1T2OfZ9LbtikKwydCU3dwBA9aToD
 7fzfDr+fJyt0lBzZXz2/OFR0YH3ehtfNX4hg/utsU3JYYgaRbjoC1T61GHE9gRWIURDIzhCQ/je
 60QpuIK+r6TSe3/Tg9R02cm3AgZZkb0j2rLAKdhYyThnfSSjAfGaw1xpdoqjRWNoGYb/x4NeJ6w
 dTIBYReEtraR7muqPf56cCh/4azx9PPKqayNqgH2K/kUH4Mg7QjJVAfL8H1rj2dUtpRaBQWAh1m
 o/fOLath4kxcngIH8d5JpUI0K2UHoKGvQKUTB7YLtRG5fjd+kP3AhS9Smrf3tr6OWT86Azo6AIp
 81T4io0wMylqizyueHEZ+PW0LWsCCyRGQWKt3uw4Jqf4sfPD8HvI/BXGwozo/W9xth/AFler0EK
 VxpTuof1/C18S/406Yw==
X-Proofpoint-GUID: 8JALK5xAaFuxK-RVGVyuupbcrotd7OGa
X-Proofpoint-ORIG-GUID: 8JALK5xAaFuxK-RVGVyuupbcrotd7OGa
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96c623 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=p0WdMEafAAAA:8
 a=W2b0fEEQJ4TDHmAVsWEA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_053341_218513_FFF10AEA 
X-CRM114-Status: GOOD (  14.60  )
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

On Mon, Aug 31, 2026 at 11:49:36AM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
> 
> There are no changes for ath10k or ath11k.
> 
> For ath12k, update the QCC2072 hw1.0 firmware to WLAN.COL.1.0.c2-00228.
> This version enables Multi-link Operation (MLO).
> 
> Please let me know if there are any problems.

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1211


-- 
With best wishes
Dmitry

